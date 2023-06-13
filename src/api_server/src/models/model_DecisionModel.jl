# This file was generated by the Julia OpenAPI Code Generator
# Do not modify this file directly. Modify the OpenAPI specification instead.

@doc raw"""
    DecisionModel(;
        decision_problem_type="GenericOpProblem",
        name=nothing,
        template=nothing,
        system=nothing,
        optimizer=nothing,
        attributes=nothing,
        horizon=nothing,
        warm_start=nothing,
        system_to_file=nothing,
        initialize_model=nothing,
        initialization_file=nothing,
        deserialize_initial_conditions=nothing,
        export_pwl_vars=nothing,
        allow_fails=nothing,
        optimizer_solve_log_print=nothing,
        detailed_optimizer_stats=nothing,
        calculate_conflict=nothing,
        direct_mode_optimizer=nothing,
        check_numerical_bounds=nothing,
        initial_time=nothing,
        time_series_cache_size=nothing,
    )

    - decision_problem_type::String
    - name::String
    - template::ProblemTemplate
    - system::DecisionModelSystem
    - optimizer::AbstractOptimizer
    - attributes::Vector{Attribute}
    - horizon::Int64
    - warm_start::Bool
    - system_to_file::Bool
    - initialize_model::Bool
    - initialization_file::String
    - deserialize_initial_conditions::Bool
    - export_pwl_vars::Bool
    - allow_fails::Bool
    - optimizer_solve_log_print::Bool
    - detailed_optimizer_stats::Bool
    - calculate_conflict::Bool
    - direct_mode_optimizer::Bool
    - check_numerical_bounds::Bool
    - initial_time::String
    - time_series_cache_size::Int64
"""
Base.@kwdef mutable struct DecisionModel <: OpenAPI.APIModel
    decision_problem_type::Union{Nothing, String} = "GenericOpProblem"
    name::Union{Nothing, String} = nothing
    template = nothing # spec type: Union{ Nothing, ProblemTemplate }
    system = nothing # spec type: Union{ Nothing, DecisionModelSystem }
    optimizer = nothing # spec type: Union{ Nothing, AbstractOptimizer }
    attributes::Union{Nothing, Vector} = nothing # spec type: Union{ Nothing, Vector{Attribute} }
    horizon::Union{Nothing, Int64} = nothing
    warm_start::Union{Nothing, Bool} = nothing
    system_to_file::Union{Nothing, Bool} = nothing
    initialize_model::Union{Nothing, Bool} = nothing
    initialization_file::Union{Nothing, String} = nothing
    deserialize_initial_conditions::Union{Nothing, Bool} = nothing
    export_pwl_vars::Union{Nothing, Bool} = nothing
    allow_fails::Union{Nothing, Bool} = nothing
    optimizer_solve_log_print::Union{Nothing, Bool} = nothing
    detailed_optimizer_stats::Union{Nothing, Bool} = nothing
    calculate_conflict::Union{Nothing, Bool} = nothing
    direct_mode_optimizer::Union{Nothing, Bool} = nothing
    check_numerical_bounds::Union{Nothing, Bool} = nothing
    initial_time::Union{Nothing, String} = nothing
    time_series_cache_size::Union{Nothing, Int64} = nothing

    function DecisionModel(
        decision_problem_type,
        name,
        template,
        system,
        optimizer,
        attributes,
        horizon,
        warm_start,
        system_to_file,
        initialize_model,
        initialization_file,
        deserialize_initial_conditions,
        export_pwl_vars,
        allow_fails,
        optimizer_solve_log_print,
        detailed_optimizer_stats,
        calculate_conflict,
        direct_mode_optimizer,
        check_numerical_bounds,
        initial_time,
        time_series_cache_size,
    )
        OpenAPI.validate_property(
            DecisionModel,
            Symbol("decision_problem_type"),
            decision_problem_type,
        )
        OpenAPI.validate_property(DecisionModel, Symbol("name"), name)
        OpenAPI.validate_property(DecisionModel, Symbol("template"), template)
        OpenAPI.validate_property(DecisionModel, Symbol("system"), system)
        OpenAPI.validate_property(DecisionModel, Symbol("optimizer"), optimizer)
        OpenAPI.validate_property(DecisionModel, Symbol("attributes"), attributes)
        OpenAPI.validate_property(DecisionModel, Symbol("horizon"), horizon)
        OpenAPI.validate_property(DecisionModel, Symbol("warm_start"), warm_start)
        OpenAPI.validate_property(DecisionModel, Symbol("system_to_file"), system_to_file)
        OpenAPI.validate_property(
            DecisionModel,
            Symbol("initialize_model"),
            initialize_model,
        )
        OpenAPI.validate_property(
            DecisionModel,
            Symbol("initialization_file"),
            initialization_file,
        )
        OpenAPI.validate_property(
            DecisionModel,
            Symbol("deserialize_initial_conditions"),
            deserialize_initial_conditions,
        )
        OpenAPI.validate_property(DecisionModel, Symbol("export_pwl_vars"), export_pwl_vars)
        OpenAPI.validate_property(DecisionModel, Symbol("allow_fails"), allow_fails)
        OpenAPI.validate_property(
            DecisionModel,
            Symbol("optimizer_solve_log_print"),
            optimizer_solve_log_print,
        )
        OpenAPI.validate_property(
            DecisionModel,
            Symbol("detailed_optimizer_stats"),
            detailed_optimizer_stats,
        )
        OpenAPI.validate_property(
            DecisionModel,
            Symbol("calculate_conflict"),
            calculate_conflict,
        )
        OpenAPI.validate_property(
            DecisionModel,
            Symbol("direct_mode_optimizer"),
            direct_mode_optimizer,
        )
        OpenAPI.validate_property(
            DecisionModel,
            Symbol("check_numerical_bounds"),
            check_numerical_bounds,
        )
        OpenAPI.validate_property(DecisionModel, Symbol("initial_time"), initial_time)
        OpenAPI.validate_property(
            DecisionModel,
            Symbol("time_series_cache_size"),
            time_series_cache_size,
        )
        return new(
            decision_problem_type,
            name,
            template,
            system,
            optimizer,
            attributes,
            horizon,
            warm_start,
            system_to_file,
            initialize_model,
            initialization_file,
            deserialize_initial_conditions,
            export_pwl_vars,
            allow_fails,
            optimizer_solve_log_print,
            detailed_optimizer_stats,
            calculate_conflict,
            direct_mode_optimizer,
            check_numerical_bounds,
            initial_time,
            time_series_cache_size,
        )
    end
end # type DecisionModel

const _property_types_DecisionModel = Dict{Symbol, String}(
    Symbol("decision_problem_type") => "String",
    Symbol("name") => "String",
    Symbol("template") => "ProblemTemplate",
    Symbol("system") => "DecisionModelSystem",
    Symbol("optimizer") => "AbstractOptimizer",
    Symbol("attributes") => "Vector{Attribute}",
    Symbol("horizon") => "Int64",
    Symbol("warm_start") => "Bool",
    Symbol("system_to_file") => "Bool",
    Symbol("initialize_model") => "Bool",
    Symbol("initialization_file") => "String",
    Symbol("deserialize_initial_conditions") => "Bool",
    Symbol("export_pwl_vars") => "Bool",
    Symbol("allow_fails") => "Bool",
    Symbol("optimizer_solve_log_print") => "Bool",
    Symbol("detailed_optimizer_stats") => "Bool",
    Symbol("calculate_conflict") => "Bool",
    Symbol("direct_mode_optimizer") => "Bool",
    Symbol("check_numerical_bounds") => "Bool",
    Symbol("initial_time") => "String",
    Symbol("time_series_cache_size") => "Int64",
)
OpenAPI.property_type(::Type{DecisionModel}, name::Symbol) =
    Union{Nothing, eval(Base.Meta.parse(_property_types_DecisionModel[name]))}

function check_required(o::DecisionModel)
    o.name === nothing && (return false)
    o.template === nothing && (return false)
    o.system === nothing && (return false)
    true
end

function OpenAPI.validate_property(::Type{DecisionModel}, name::Symbol, val) end
