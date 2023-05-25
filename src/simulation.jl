"""
Make a PowerSimulation from a simulation defined by the API.
"""
function make_simulation(sim::ApiServer.Simulation, output_dir)
    decision_models = Vector{PSI.DecisionModel}()
    for api_model in sim.models.decision_models
        optimizer_type = make_optimizer(api_model.optimizer.value)
        kwargs = Dict{String, Any}()
        for name in fieldnames(typeof(api_model.optimizer.value))
            if name != :optimizer_type
                kwargs[string(name)] = getproperty(api_model.optimizer.value, name)
            end
        end
        optimizer = JuMP.optimizer_with_attributes(optimizer_type, kwargs...)
        # TODO: Add support for time_series_read_only to PSB.
        sys = _make_system(api_model.system.value)
        decision_problem_type = _convert_string_to_type(PSI, api_model.decision_problem_type)
        network_type = _convert_string_to_type(PSI, api_model.template.network.network_type)
        use_slacks = api_model.template.network.use_slacks
        api_duals = isnothing(api_model.template.network.duals) ? [] : api_model.template.network.duals
        duals = [_convert_string_to_type(PSI, x) for x in api_duals]
        if isnothing(api_model.template.network.ptdf_matrix)
            network = PSI.NetworkModel(network_type, use_slacks=use_slacks, duals=duals)
        else
            ptdf_matrix = _convert_string_to_type(PSI, api_model.template.network.ptdf_matrix)
            network = PSI.NetworkModel(network_type, use_slacks=use_slacks, duals=duals, PTDF_matrix=ptdf_matrix)
        end

        template = PSI.ProblemTemplate()
        PSI.set_network_model!(template, network)
        for device_model in api_model.template.devices
            device_type = _convert_string_to_type(PSY, device_model.device_type)
            formulation_type = _convert_string_to_type(PSI, device_model.formulation)
            PSI.set_device_model!(template, device_type, formulation_type)
        end
        for service_model in api_model.template.services
            service_type = _convert_string_to_type(PSY, service_model.service_type)
            formulation_type = _convert_string_to_type(PSI, service_model.formulation)
            PSI.set_service_model!(template, service_type, formulation_type)
        end
        decision_model = PSI.DecisionModel(
            decision_problem_type,
            template,
            sys;
            name=api_model.name,
            optimizer=optimizer,
        )
        push!(decision_models, decision_model)
    end

    models = PSI.SimulationModels(decision_models=decision_models)
    feedforwards = Dict{String, Vector{PSI.AbstractAffectFeedforward}}()
    for ff_by_model in sim.sequence.feedforwards_by_model
        feedforwards[ff_by_model.model_name] = Vector{PSI.AbstractAffectFeedforward}()
        for ff in ff_by_model.feedforwards
            push!(feedforwards[ff_by_model.model_name], _make_feedforward(ff.value))
        end
    end

    sequence = PSI.SimulationSequence(;
        models=models,
        feedforwards=feedforwards,
        ini_cond_chronology=_convert_string_to_type(PSI, sim.sequence.initial_condition_chronology_type)(),
    )

    return PSI.Simulation(
        name=sim.name,
        steps=sim.num_steps,
        sequence=sequence,
        models=models,
        simulation_folder=output_dir,
    )
end

"""
Run a simulation to completion on a worker process.
"""
function run_simulation(simulation::ApiServer.Simulation, output_dir, channels)
    # The PSI simulation cannot be passed between processes because the optimizer
    # cannot be serialized.
    if isnothing(output_dir)
        output_dir = DEFAULT_OUTPUT_DIR
    end
    mkpath(output_dir)
    sim = make_simulation(simulation, output_dir)
    build_status = PSI.build!(sim; console_level=Logging.AboveMaxLevel)
    run_status = PSI.RunStatus.NOT_READY
    path = PSI.get_simulation_dir(sim)
    if build_status != PSI.BuildStatus.BUILT
        @error "Failed to build the simulation: $build_status"
        result = SimulationExecutionResult(
            return_code=1,
            build_status=build_status.value,
            run_status=run_status.value,
            path=path,
        )
        put!(channels.done, result)
        return
    end

    @info "Built simulation $(simulation.name)"
    return_code = 1
    try
        run_status = PSI.execute!(
            sim;
            enable_progress_bar=false,
            commands_channel=channels.commands,
            results_channel=channels.results,
        )
        if run_status == PSI.RunStatus.SUCCESSFUL
            return_code = 0
        end
    finally
        @info "Simulation is complete" simulation.name
        result = SimulationExecutionResult(
            return_code=return_code,
            build_status=build_status.value,
            run_status=run_status.value,
            path=path,
        )
        put!(channels.done, result)
    end
end

function _make_feedforward(data::Dict)
    # We shouldn't have to do this manually, but OpenAPI is not deserializing into types.
    type = _convert_string_to_type(ApiServer, data["feedforward_type"])
    ff = type(; Dict(Symbol(k) => v for (k, v) in data)...)
    return _make_feedforward(ff)
end

function _make_feedforward(ff::ApiServer.EnergyLimitFeedforward)
    return PSI.EnergyLimitFeedforward(
        component_type=_convert_string_to_type(PSY, ff.component_type),
        source=_convert_string_to_type(PSI, ff.source),
        affected_values=[_convert_string_to_type(PSI, x) for x in ff.affected_values],
        number_of_periods=ff.number_of_periods,
    )
end

function _make_feedforward(ff::ApiServer.FixValueFeedforward)
    return PSI.FixValueFeedforward(
        component_type=_convert_string_to_type(PSY, ff.component_type),
        source=_convert_string_to_type(PSI, ff.source),
        affected_values=[_convert_string_to_type(PSI, x) for x in ff.affected_values],
    )
end

function _make_feedforward(ff::ApiServer.SemiContinuousFeedforward)
    return PSI.SemiContinuousFeedforward(
        component_type=_convert_string_to_type(PSY, ff.component_type),
        source=_convert_string_to_type(PSI, ff.source),
        affected_values=[_convert_string_to_type(PSI, x) for x in ff.affected_values],
    )
end
