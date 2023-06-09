# This file was generated by the Julia OpenAPI Code Generator
# Do not modify this file directly. Modify the OpenAPI specification instead.

@doc raw"""
    CplexOptimizer(;
        optimizer_type=nothing,
    )

    - optimizer_type::String
"""
Base.@kwdef mutable struct CplexOptimizer <: OpenAPI.APIModel
    optimizer_type::Union{Nothing, String} = nothing

    function CplexOptimizer(optimizer_type)
        OpenAPI.validate_property(CplexOptimizer, Symbol("optimizer_type"), optimizer_type)
        return new(optimizer_type)
    end
end # type CplexOptimizer

const _property_types_CplexOptimizer =
    Dict{Symbol, String}(Symbol("optimizer_type") => "String")
OpenAPI.property_type(::Type{CplexOptimizer}, name::Symbol) =
    Union{Nothing, eval(Base.Meta.parse(_property_types_CplexOptimizer[name]))}

function check_required(o::CplexOptimizer)
    o.optimizer_type === nothing && (return false)
    true
end

function OpenAPI.validate_property(::Type{CplexOptimizer}, name::Symbol, val) end
