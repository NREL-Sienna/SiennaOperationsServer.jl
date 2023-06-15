# This file was generated by the Julia OpenAPI Code Generator
# Do not modify this file directly. Modify the OpenAPI specification instead.


@doc raw"""
    HighsOptimizer(;
        optimizer_type=nothing,
        time_limit=100.0,
        log_to_console=false,
        mip_rel_gap=0.0000010,
    )

    - optimizer_type::String
    - time_limit::Float64
    - log_to_console::Bool
    - mip_rel_gap::Float64
"""
Base.@kwdef mutable struct HighsOptimizer <: OpenAPI.APIModel
    optimizer_type::Union{Nothing, String} = nothing
    time_limit::Union{Nothing, Float64} = 100.0
    log_to_console::Union{Nothing, Bool} = false
    mip_rel_gap::Union{Nothing, Float64} = 0.0000010

    function HighsOptimizer(optimizer_type, time_limit, log_to_console, mip_rel_gap, )
        OpenAPI.validate_property(HighsOptimizer, Symbol("optimizer_type"), optimizer_type)
        OpenAPI.validate_property(HighsOptimizer, Symbol("time_limit"), time_limit)
        OpenAPI.validate_property(HighsOptimizer, Symbol("log_to_console"), log_to_console)
        OpenAPI.validate_property(HighsOptimizer, Symbol("mip_rel_gap"), mip_rel_gap)
        return new(optimizer_type, time_limit, log_to_console, mip_rel_gap, )
    end
end # type HighsOptimizer

const _property_types_HighsOptimizer = Dict{Symbol,String}(Symbol("optimizer_type")=>"String", Symbol("time_limit")=>"Float64", Symbol("log_to_console")=>"Bool", Symbol("mip_rel_gap")=>"Float64", )
OpenAPI.property_type(::Type{ HighsOptimizer }, name::Symbol) = Union{Nothing,eval(Base.Meta.parse(_property_types_HighsOptimizer[name]))}

function check_required(o::HighsOptimizer)
    o.optimizer_type === nothing && (return false)
    true
end

function OpenAPI.validate_property(::Type{ HighsOptimizer }, name::Symbol, val)
end
