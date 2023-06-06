const SIMULATIONS_FILENAME = "simulations.json"

Base.@kwdef struct CachedInstance{T, U}
    api_instance::T
    sienna_instance::U
end

Base.@kwdef struct CommunicationChannels
    "Allows the manager process to control what the worker processes collect."
    commands::RemoteChannel
    "Allows the worker processes to pass output data to the manager."
    results::RemoteChannel
    "Allows the worker processes to tell the manager that they are done."
    done::RemoteChannel
end

Base.@kwdef mutable struct SimulationContext
    id::Int
    name::String
    path::String = ""
    status::String
    start_time::DateTime
    worker_pid::Int
    return_code::Int = -1
    exec_time_s::Float64 = -1.0
    channels::Union{Nothing, CommunicationChannels} = nothing
    progress_events::Vector{ApiServer.SimulationProgressEvent} =
        Vector{ApiServer.SimulationProgressEvent}()
    lock::ReentrantLock = ReentrantLock()
end

Base.@kwdef struct SimulationExecutionResult
    return_code::Int
    build_status::Int
    run_status::Int
    path::String
end
