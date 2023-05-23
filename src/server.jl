const DEFAULT_OUTPUT_DIR = "simulation_output"
const manager = Manager()
const server = Ref{Any}(nothing)

# TODO: return proper HTTP error codes, like 404 if something isn't stored.

delete_simulation(req::HTTP.Request, name::Any) = delete_simulation!(manager, name)
delete_simulations(req::HTTP.Request) = delete_simulations!(manager)
delete_system(req::HTTP.Request, uuid::Any) = delete_system!(manager, Base.UUID(uuid))
delete_systems(req::HTTP.Request) = delete_systems!(manager)
get_simulation(req::HTTP.Request, name) = get_simulation(ApiServer.Simulation, name)
get_system(req::HTTP.Request, uuid) = get_system(ApiServer.System, Base.UUID(uuid))
list_simulations(req::HTTP.Request) = Dict("simulations" => list_simulations(ApiServer.Simulation, manager))
list_systems(req::HTTP.Request) = Dict("systems" => list_systems(ApiServer.System, manager))

function post_simulation(req::HTTP.Request, api_sim::ApiServer.Simulation)
    add_simulation!(manager, api_sim)
    return api_sim
end

function post_system(req::HTTP.Request, body::ApiServer.PostSystemBody)
    add_system!(manager, body)
    return Dict("Message" => "Added system")
end

function post_system_case(req::HTTP.Request, category::String, name::String; force_build = false)
    add_system_from_case!(manager, category, name; force_build = force_build)
    return Dict("Message" => "Added system from case")
end

function get_simulation_status(req::HTTP.Request, id; clear_progress_events = true)
    if isnothing(clear_progress_events)
        # TODO: we shouldn't need this...
        clear_progress_events = true
    end
    return get_simulation_status!(manager, id, clear_progress_events)
end

function list_simulation_statuses(req::HTTP.Request; clear_progress_events = true, status = nothing)
    if isnothing(clear_progress_events)
        # TODO: we shouldn't need this...
        clear_progress_events = true
    end
    # TODO: consider an option to force a check now. Would need to add synchronization
    # with background task.
    return list_simulation_statuses!(manager, clear_progress_events, status)
end

function start_simulation(
    req::HTTP.Request,
    sim::ApiServer.Simulation;
    output_dir=DEFAULT_OUTPUT_DIR,
    poll_interval=5,
)
    status = start_simulation_async!(
        manager,
        sim;
        output_dir = output_dir,
        poll_interval=poll_interval,
    )
    return Dict("status" => status)
end

function start_stored_simulation(
    req::HTTP.Request,
    name::String;
    output_dir=DEFAULT_OUTPUT_DIR,
    poll_interval=5,
)
    status = start_simulation_async!(
        manager,
        get_simulation(manager, name);
        output_dir = output_dir,
        poll_interval=poll_interval,
    )
    return Dict("status" => status)
end

function cancel_simulation(req::HTTP.Request, id::Int)
    cancel_simulation!(manager, id)
    return Dict("Message" => "Canceled simulation $id")
end

function cache_simulation_results(req::HTTP.Request, id::Int)
    cache_simulation_results!(manager, id)
    return Dict("Message" => "Cached results for simulation $id")
end

function discard_simulation_results(req::HTTP.Request, id::Int)
    discard_simulation_results!(manager, id)
    return Dict("Message" => "Discarded cached results for simulation $id")
end

function list_cache_simulation_results(req::HTTP.Request)
    return Dict("simulation_ids" => list_cache_simulation_results!(manager))
end

function list_decision_problems(req::HTTP.Request, id::Int)
    return Dict("decision_problems" => list_decision_problems(manager, id))
end

function list_variable_names(req::HTTP.Request, id::Int, problem_name)
    return Dict("variable_names" => list_variable_names(manager, id, problem_name))
end

function read_realized_variable_results(req::HTTP.Request, id::Int, problem_name, variable_name)
    return JSONTables.objecttable(read_realized_variable_results(manager, id, problem_name, variable_name))
end

function save(::HTTP.Request; filename = nothing)
    if isnothing(filename)
        filename = SIMULATIONS_FILENAME
    end
    save(manager; filename = filename)
    return Dict("message" => "Saved data to $filename")
end

function load(::HTTP.Request; filename = nothing)
    if isnothing(filename)
        filename = SIMULATIONS_FILENAME
    end
    load!(manager; filename = filename)
    return Dict("message" => "Loaded data from $filename")
end

function stop(::HTTP.Request)
    @info "Stop server"
    HTTP.close(server[])
    return HTTP.Response(200, "")
end

function ping(::HTTP.Request)
    return HTTP.Response(200, "")
end

function run_server(;
    port = 8081,
    output_dir = "api_server",
    console_level = Logging.Info,
    file_level = Logging.Info,
    mode = "a",
)
    mkpath(output_dir)
    configure_logging(output_dir, console_level, file_level, mode)
    try
        router = HTTP.Router()
        router = ApiServer.register(router, @__MODULE__)
        HTTP.register!(router, "GET", "/stop", stop)
        HTTP.register!(router, "GET", "/ping", ping)
        server[] = HTTP.serve!(router, port)
        wait(server[])
    catch ex
        @error("Server error", exception=(ex, catch_backtrace()))
    end
end

function configure_logging(output_dir, console_level, file_level, mode)
    return IS.configure_logging(;
        console = true,
        console_stream = stderr,
        console_level = console_level,
        file = true,
        filename = joinpath(output_dir, "api_server.log"),
        file_level = file_level,
        file_mode = mode,
        set_global = true,
    )

end
