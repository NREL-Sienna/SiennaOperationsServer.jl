const DEFAULT_OUTPUT_DIR = "simulation_output"
const manager = Manager()
const server = Ref{Any}(nothing)

# TODO: return proper HTTP error codes, like 404 if something isn't stored.

delete_simulation(req::HTTP.Request, name::Any) = delete_simulation!(manager, name)
delete_simulations(req::HTTP.Request) = delete_simulations!(manager)
delete_system(req::HTTP.Request, uuid::Any) = delete_system!(manager, Base.UUID(uuid))
delete_systems(req::HTTP.Request) = delete_systems!(manager)

function get_simulation(req::HTTP.Request, name)
    @map_exceptions_to_http get_simulation(ApiServer.Simulation, manager, name)
end

function get_system(req::HTTP.Request, uuid)
    @map_exceptions_to_http get_system(ApiServer.System, manager, Base.UUID(uuid))
end

function list_simulations(req::HTTP.Request)
    ApiServer.ListSimulationsResponse(
        simulations=list_simulations(ApiServer.Simulation, manager),
    )
end

function list_systems(req::HTTP.Request)
    ApiServer.ListSystemsResponse(systems=list_systems(ApiServer.System, manager))
end

function post_simulation(req::HTTP.Request, api_sim::ApiServer.Simulation)
    @map_exceptions_to_http add_simulation!(manager, api_sim)
end

function post_system(req::HTTP.Request, body::ApiServer.PostSystemBody)
    @map_exceptions_to_http add_system!(manager, body)
end

function post_system_case(
    req::HTTP.Request,
    category::String,
    name::String;
    force_build=false,
)
    @map_exceptions_to_http add_system_from_case!(
        manager,
        category,
        name;
        force_build=force_build,
    )
end

function get_simulation_status(req::HTTP.Request, id; clear_progress_events=true)
    if isnothing(clear_progress_events)
        # TODO: we shouldn't need this...
        clear_progress_events = true
    end

    @map_exceptions_to_http get_simulation_status!(manager, id, clear_progress_events)
end

function list_simulation_statuses(
    req::HTTP.Request;
    clear_progress_events=true,
    status=nothing,
)
    if isnothing(clear_progress_events)
        # TODO: we shouldn't need this...
        clear_progress_events = true
    end
    # TODO: consider an option to force a check now. Would need to add synchronization
    # with background task.
    return ApiServer.SimulationStatuses(
        statuses=list_simulation_statuses!(manager, clear_progress_events, status),
    )
end

function start_simulation(
    req::HTTP.Request,
    sim::ApiServer.Simulation;
    output_dir=DEFAULT_OUTPUT_DIR,
    poll_interval=5,
)
    @map_exceptions_to_http begin
        status = start_simulation_async!(
            manager,
            sim;
            output_dir=output_dir,
            poll_interval=poll_interval,
        )
        return Dict("status" => status)
    end
end

function start_stored_simulation(
    req::HTTP.Request,
    name::String;
    output_dir=DEFAULT_OUTPUT_DIR,
    poll_interval=5,
)
    @map_exceptions_to_http begin
        status = start_simulation_async!(
            manager,
            get_simulation(ApiServer.Simulation, manager, name);
            output_dir=output_dir,
            poll_interval=poll_interval,
        )
        return Dict("status" => status)
    end
end

function cancel_simulation(req::HTTP.Request, id::Int)
    @map_exceptions_to_http begin
        cancel_simulation!(manager, id)
        return Dict("Message" => "Canceled simulation $id")
    end
end

function cache_simulation_results(req::HTTP.Request, id::Int)
    @map_exceptions_to_http begin
        cache_simulation_results!(manager, id)
        return Dict("Message" => "Cached results for simulation $id")
    end
end

function discard_simulation_results(req::HTTP.Request, id::Int)
    @map_exceptions_to_http begin
        discard_simulation_results!(manager, id)
        return Dict("Message" => "Discarded cached results for simulation $id")
    end
end

function list_cached_simulation_results(req::HTTP.Request)
    return Dict("simulation_ids" => list_cached_simulation_results(manager))
end

function list_decision_problems(req::HTTP.Request, id::Int)
    @map_exceptions_to_http ApiServer.ListNamesResponse(
        names=list_decision_problems(manager, id),
    )
end

function list_aux_variable_names(req::HTTP.Request, id::Int, problem_name)
    @map_exceptions_to_http ApiServer.ListNamesResponse(
        names=list_aux_variable_names(manager, id, problem_name),
    )
end

function list_dual_names(req::HTTP.Request, id::Int, problem_name)
    @map_exceptions_to_http ApiServer.ListNamesResponse(
        names=list_dual_names(manager, id, problem_name),
    )
end

function list_expression_names(req::HTTP.Request, id::Int, problem_name)
    @map_exceptions_to_http ApiServer.ListNamesResponse(
        names=list_expression_names(manager, id, problem_name),
    )
end

function list_parameter_names(req::HTTP.Request, id::Int, problem_name)
    @map_exceptions_to_http ApiServer.ListNamesResponse(
        names=list_parameter_names(manager, id, problem_name),
    )
end

function list_variable_names(req::HTTP.Request, id::Int, problem_name)
    @map_exceptions_to_http ApiServer.ListNamesResponse(
        names=list_variable_names(manager, id, problem_name),
    )
end

function read_realized_aux_variable_results(
    req::HTTP.Request,
    id::Int,
    problem_name,
    aux_variable_name,
)
    @map_exceptions_to_http JSONTables.objecttable(
        read_realized_aux_variable_results(manager, id, problem_name, aux_variable_name),
    )
end

function read_realized_dual_results(req::HTTP.Request, id::Int, problem_name, dual_name)
    @map_exceptions_to_http JSONTables.objecttable(
        read_realized_dual_results(manager, id, problem_name, dual_name),
    )
end

function read_realized_expression_results(
    req::HTTP.Request,
    id::Int,
    problem_name,
    expression_name,
)
    @map_exceptions_to_http JSONTables.objecttable(
        read_realized_expression_results(manager, id, problem_name, expression_name),
    )
end

function read_realized_parameter_results(
    req::HTTP.Request,
    id::Int,
    problem_name,
    parameter_name,
)
    @map_exceptions_to_http JSONTables.objecttable(
        read_realized_parameter_results(manager, id, problem_name, parameter_name),
    )
end

function read_realized_variable_results(
    req::HTTP.Request,
    id::Int,
    problem_name,
    variable_name,
)
    @map_exceptions_to_http JSONTables.objecttable(
        read_realized_variable_results(manager, id, problem_name, variable_name),
    )
end

function read_optimizer_stats(req::HTTP.Request, id::Int, problem_name)
    @map_exceptions_to_http begin
        df = read_optimizer_stats(manager, id, problem_name)
        func(x) = ismissing(x) || (x isa Number && isnan(x)) ? nothing : x
        JSONTables.objecttable(func.(df))
    end
end

function get_store(::HTTP.Request)
    @map_exceptions_to_http get_store(manager)
end

function load_store(::HTTP.Request, store::ApiServer.Store)
    @map_exceptions_to_http begin
        load_store!(manager, store)
        return Dict("message" => "Loaded store")
    end
end

function delete_store(::HTTP.Request)
    @map_exceptions_to_http begin
        delete_store!(manager)
        return Dict("message" => "Deleted store")
    end
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
    port=8081,
    output_dir="api_server",
    console_level=Logging.Info,
    file_level=Logging.Info,
    mode="a",
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
        @error("Server error", exception = (ex, catch_backtrace()))
    end
end

function configure_logging(output_dir, console_level, file_level, mode)
    return IS.configure_logging(;
        console=true,
        console_stream=stderr,
        console_level=console_level,
        file=true,
        filename=joinpath(output_dir, "api_server.log"),
        file_level=file_level,
        file_mode=mode,
        set_global=true,
    )
end
