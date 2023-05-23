mutable struct Manager
    simulations::Dict{String, CachedInstance{ApiServer.Simulation, PSI.Simulation}}
    systems::Dict{Base.UUID, CachedInstance{ApiServer.System, PSY.System}}
    simulation_contexts::Dict{Int, SimulationContext}
    in_use_workers::Set{Int}
    next_simulation_id::Integer
    cached_simulation_results::Dict{Int, PSI.SimulationResults}
end

function Manager()
    return Manager(
        Dict{String, CachedInstance{ApiServer.Simulation, PSI.Simulation}}(),
        Dict{Base.UUID, CachedInstance{ApiServer.System, PSY.System}}(),
        Dict{Int, SimulationContext}(),
        Set{Int}(),
        1,
        Dict{Int, PSI.SimulationResults}(),
    )
end

function _get_next_simulation_id!(manager::Manager)
    next_id = manager.next_simulation_id
    manager.next_simulation_id += 1
    return next_id
end

function add_simulation!(manager::Manager, api_sim::ApiServer.Simulation)
    if haskey(manager.simulations, api_sim.name)
        error("A simulation with name = $(api_sim.name) is already stored")
    end
    simulation = make_simulation(api_sim, DEFAULT_OUTPUT_DIR)
    manager.simulations[simulation.name] = CachedInstance(api_sim, simulation)
    @info "Successfully stored" api_sim
end

function add_system!(manager::Manager, item)
    if !isfile(item.path)
        error("path = $(item.path) is not a valid file")
    end
    system = PSY.System(item.path)
    return _store_system!(manager, system)
end

function add_system_from_case!(manager::Manager, category, name; force_build=false)
    if isnothing(force_build)
        force_build = false
    end
    system = make_system_from_case(category, name; force_build=force_build)
    return _store_system!(manager, system)
end

function get_cached_simulation_instance(manager::Manager, name::String)
    !haskey(manager.simulations, name) && error("Simulation $name is not stored")
    return manager.simulations[name]
end

function get_cached_system_instance(manager::Manager, uuid::Base.UUID)
    !haskey(manager.systems, uuid) && error("System $uuid is not stored")
    return manager.systems[uuid]
end

function get_simulation(::Type{ApiServer.Simulation}, manager::Manager, name::String)
    return get_cached_simulation_instance(manager, name).api_instance
end

function get_simulation(::Type{PSI.Simulation}, manager::Manager, name::String)
    return get_cached_simulation_instance(manager, name).sienna_instance
end

function list_simulations(::Type{ApiServer.Simulation}, manager::Manager)
    return [x.api_instance for x in (values(manager.simulations))]
end

function get_system(::Type{ApiServer.System}, manager::Manager, uuid::Base.UUID)
    return get_cached_system_instance(manager, uuid).api_instance
end

function list_systems(::Type{ApiServer.System}, manager::Manager)
    return [x.api_instance for x in (values(manager.systems))]
end

function get_system(::Type{PSY.System}, manager::Manager, uuid::Base.UUID)
    return get_cached_system_instance(manager, uuid).sienna_instance
end

function delete_system!(manager::Manager, uuid::Base.UUID)
    if haskey(manager.systems, uuid)
        pop!(manager.systems, uuid)
        @info "Removed system" uuid
    end

    return
end

function delete_systems!(manager::Manager)
    for uuid in collect(keys(manager.systems))
        delete_system!(manager, uuid)
    end
end

function delete_simulation!(manager::Manager, name::AbstractString)
    if haskey(manager.simulations, name)
        pop!(manager.simulations, name)
        @info "Removed simulation" name
    end
    return
end

function delete_simulations!(manager::Manager)
    for name in collect(keys(manager.simulations))
        delete_simulation!(manager, name)
    end
end

function get_simulation_context(manager::Manager, id::Int)
    !haskey(manager.simulation_contexts, id) && error("Simulation $id is not stored")
    return manager.simulation_contexts[id]
end

"""
Return the status for this simulation.

# Arguments

  - `manager::Manager`: Manager
  - `name::String`: Simulation name
  - `clear_progress_events::Bool`: If true, clear progress events the read.
"""
function get_simulation_status!(manager::Manager, id::Int, clear_progress_events)
    context = get_simulation_context(manager, id)
    lock(context.lock) do
        status = ApiServer.SimulationStatus(
            simulation_id=context.id,
            name=context.name,
            path=context.path,
            status=context.status,
            start_time=string(context.start_time),
            worker_pid=context.worker_pid,
            progress_events=context.progress_events[:],
        )
        if clear_progress_events
            empty!(context.progress_events)
        end
        return status
    end
end

"""
Return the status for all simulations.

# Arguments

  - `manager::Manager`: Manager
  - `clear_progress_events::Bool`: If true, clear progress events the read.
  - `status::String`: If set, filter by this status.
"""
function list_simulation_statuses!(manager::Manager, clear_progress_events, status=nothing)
    statuses = Vector{ApiServer.SimulationStatus}()
    for id in keys(manager.simulation_contexts)
        sim_status = get_simulation_status!(manager, id, clear_progress_events)
        if isnothing(status) || sim_status.status == status
            push!(statuses, sim_status)
        end
    end
    return statuses
end

"""
Check the status of all running simulations. Handles completions.
"""
function check_simulation_statuses!(manager::Manager)
    for context in values(manager.simulation_contexts)
        if context.status == "running"
            check_status!(manager, context)
        end
    end
end

"""
Check the status of the simulation. Handles a completion if it is now done.
"""
function check_status!(manager::Manager, context::SimulationContext)
    is_done = false
    while isready(context.channels.results)
        results = take!(context.channels.results)
        event = ApiServer.SimulationProgressEvent(
            model_name=results.progress_event.model_name,
            step=results.progress_event.step,
            index=results.progress_event.index,
            timestamp=string(results.progress_event.timestamp),
            wall_time=string(results.progress_event.wall_time),
            exec_time_s=results.progress_event.exec_time_s,
        )
        lock(context.lock) do
            push!(context.progress_events, event)
        end
        # TODO: result data
    end

    if isready(context.channels.done)
        is_done = true
        result = take!(context.channels.done)
        _complete_simulation!(manager, context, result)
    end

    return is_done
end

function _get_available_worker!(manager::Manager)
    for worker_pid in Distributed.workers()
        if !in(manager.in_use_workers, worker_pid)
            push!(manager.in_use_workers, worker_pid)
            return worker_pid
        end
    end

    error("There are no available workers.")
end

get_num_running_simulations(manager::Manager) = length(manager.in_use_workers)

"""
Start a simulation on a worker process.
"""
function start_simulation_async!(
    manager::Manager,
    simulation::ApiServer.Simulation;
    output_dir=nothing,
    poll_interval=5,
)
    num_running = get_num_running_simulations(manager)
    if Distributed.nworkers() - num_running <= 0
        # TODO: implement queuing
        error(
            "There are not enough worker processes to run a simulation. " *
            "num_running=$(num_running) num_workers=$(Distributed.nworkers())",
        )
    end

    # This is 1 because any new command will overwrite the previous one.
    commands = RemoteChannel(() -> Channel{PSI.ControlCommand}(1))
    results = RemoteChannel(() -> Channel{PSI.SimulationIntermediateResult}(10))
    done = RemoteChannel(() -> Channel{SimulationExecutionResult}(1))

    worker = _get_available_worker!(manager)
    channels = CommunicationChannels(commands, results, done)
    remote_do(run_simulation, worker, simulation, output_dir, channels)
    context = SimulationContext(;
        id=_get_next_simulation_id!(manager),
        name=simulation.name,
        status="running",
        start_time=Dates.now(),
        worker_pid=worker,
        channels=channels,
    )
    manager.simulation_contexts[context.id] = context
    @info "Started simulation" context.id context.name worker

    function update_status()
        sleep(poll_interval)
        is_done = check_status!(manager, context)
        @debug "Run update task" poll_interval is_done
        if is_done
            @info "Found a completed simulation" context.id
        else
            update_task = @task update_status()
            schedule(update_task)
        end
    end
    update_task = @task update_status()
    schedule(update_task)

    status = ApiServer.SimulationStatus(
        simulation_id=context.id,
        name=context.name,
        path="",
        status=context.status,
        start_time=string(context.start_time),
        worker_pid=context.worker_pid,
        progress_events=context.progress_events[:],
    )
    return status
end

"""
Cancel a simulation by sending the equivalent of Ctrl-C to the process.

# Arguments

  - `manager::Manager`: Manager
  - `name::String`: Simulation name
"""
function cancel_simulation!(manager::Manager, id::Int)
    context = get_simulation_context(manager, id)
    Distributed.interrupt(context.worker_pid)
    _complete_simulation!(manager, context, -1; canceled=true)
    @info "Canceled simulation $id $(context.name)"
end

function _complete_simulation!(manager::Manager, context, result; canceled=false)
    pop!(manager.in_use_workers, context.worker_pid)
    exec_time_s = Dates.Millisecond(Dates.now() - context.start_time).value / 1000
    context.status = canceled ? "canceled" : "done"
    context.return_code = result.return_code
    context.path = result.path
    context.exec_time_s = exec_time_s
    @info "Completed simulation $(context.name)"
    return
end

function _get_cached_simulation_results(manager, id::Int)
    if !haskey(manager.cached_simulation_results, id)
        error("Results are not cached for simulation ID $id")
    end
    return manager.cached_simulation_results[id]
end

function _get_cached_decision_problem_results(manager, id::Int, problem_name::String)
    results = _get_cached_simulation_results(manager, id)
    return PSI.get_decision_problem_results(results, problem_name)
end

function cache_simulation_results!(manager, id::Int)
    context = get_simulation_context(manager, id)
    results = PSI.SimulationResults(context.path)
    manager.cached_simulation_results[id] = results
    @info "Cached results for simulation ID $id"
end

function discard_simulation_results!(manager, id::Int)
    res = pop!(manager.cached_simulation_results, id, nothing)
    if !isnothing(res)
        @info "Discarded cached results for simulation ID $id"
    end
end

function list_cached_simulation_results(manager)
    return collect(keys(manager.cached_simulation_results))
end

function list_decision_problems(manager::Manager, id::Int)
    results = _get_cached_simulation_results(manager, id)
    problems = PSI.list_decision_problems(results)
    @show problems
    return problems
end

function list_aux_variable_names(manager::Manager, id::Int, problem_name)
    results = _get_cached_decision_problem_results(manager, id, problem_name)
    return PSI.list_aux_variable_names(results)
end

function list_dual_names(manager::Manager, id::Int, problem_name)
    results = _get_cached_decision_problem_results(manager, id, problem_name)
    return PSI.list_dual_names(results)
end

function list_expression_names(manager::Manager, id::Int, problem_name)
    results = _get_cached_decision_problem_results(manager, id, problem_name)
    return PSI.list_expression_names(results)
end

function list_parameter_names(manager::Manager, id::Int, problem_name)
    results = _get_cached_decision_problem_results(manager, id, problem_name)
    return PSI.list_parameter_names(results)
end

function list_variable_names(manager::Manager, id::Int, problem_name)
    results = _get_cached_decision_problem_results(manager, id, problem_name)
    return PSI.list_variable_names(results)
end

function read_realized_aux_variable_results(
    manager::Manager,
    id::Int,
    problem_name,
    aux_variable_name,
)
    results = _get_cached_decision_problem_results(manager, id, problem_name)
    return PSI.read_realized_aux_variable(results, aux_variable_name)
end

function read_realized_dual_results(manager::Manager, id::Int, problem_name, dual_name)
    results = _get_cached_decision_problem_results(manager, id, problem_name)
    return PSI.read_realized_dual(results, dual_name)
end

function read_realized_expression_results(
    manager::Manager,
    id::Int,
    problem_name,
    expression_name,
)
    results = _get_cached_decision_problem_results(manager, id, problem_name)
    return PSI.read_realized_expression(results, expression_name)
end

function read_realized_parameter_results(
    manager::Manager,
    id::Int,
    problem_name,
    parameter_name,
)
    results = _get_cached_decision_problem_results(manager, id, problem_name)
    return PSI.read_realized_parameter(results, parameter_name)
end

function read_realized_variable_results(
    manager::Manager,
    id::Int,
    problem_name,
    variable_name,
)
    results = _get_cached_decision_problem_results(manager, id, problem_name)
    return PSI.read_realized_variable(results, variable_name)
end

"""
Convert a PowerSystems System to an API System and store it.
"""
function _store_system!(manager::Manager, system::PSY.System)
    uuid = InfrastructureSystems.get_uuid(system)
    haskey(manager.systems, uuid) && error("A system with UUID $(uuid) is already stored.")
    resolution = string(Dates.Minute(PSY.get_time_series_resolution(system)))
    api_system = ApiServer.System(;
        uuid=string(uuid),
        name=PSY.get_name(system),
        description=PSY.get_description(system),
        forecast_initial_times=string.(PSY.get_forecast_initial_times(system)),
        forecast_window_count=PSY.get_forecast_window_count(system),
        forecast_horizon=PSY.get_forecast_horizon(system),
        forecast_initial_timestamp=string(PSY.get_forecast_initial_timestamp(system)),
        forecast_interval=string(PSY.get_forecast_interval(system)),
        time_series_resolution=resolution,
    )
    manager.systems[uuid] = CachedInstance(api_system, system)
    @info "Successfully stored $api_system"
    return api_system
end

"""
Return the contents of the store.
"""
function get_store(manager::Manager)
    return ApiServer.Store(
        simulations=list_simulations(ApiServer.Simulation, manager),
        statuses=list_simulation_statuses!(manager, false),
    )
end

"""
Load the passed data into the store.
"""
function load_store!(manager::Manager, store::ApiServer.Store)
    # Check for errors before adding anything.
    for item in store.simulations
        if haskey(manager.simulations, item.name)
            error("Simulation $(item.name) is already stored")
        end
    end
    for item in store.statuses
        if haskey(manager.simulation_contexts, item.simulation_id)
            error("Simulation ID $(item.simulation_id) is already stored")
        end
    end

    for sim in store.simulations
        add_simulation!(manager, sim)
    end
    for status in store.statuses
        manager.simulation_contexts[status.simulation_id] = SimulationContext(;
            id=status.simulation_id,
            name=status.name,
            path=status.path,
            status=status.status,
            start_time=DateTime(status.start_time),
            worker_pid=status.worker_pid,
            progress_events=status.progress_events,
        )
    end

    num_simulations = length(store.simulations)
    num_statuses = length(store.statuses)
    @info "Loaded $num_simulations simulations and $num_statuses simulation statuses"
end

"""
Delete the data in the store.
"""
function delete_store!(manager::Manager)
    empty!(manager.simulations)
    empty!(manager.systems)
    empty!(manager.simulation_contexts)
    empty!(manager.cached_simulation_results)
end

# TODO: add function to load simulation result from directory (not run through server)
