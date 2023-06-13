# This file was generated by the Julia OpenAPI Code Generator
# Do not modify this file directly. Modify the OpenAPI specification instead.

@doc raw"""
    Store(;
        simulations=nothing,
        statuses=nothing,
    )

    - simulations::Vector{Simulation}
    - statuses::Vector{SimulationStatus}
"""
Base.@kwdef mutable struct Store <: OpenAPI.APIModel
    simulations::Union{Nothing, Vector} = nothing # spec type: Union{ Nothing, Vector{Simulation} }
    statuses::Union{Nothing, Vector} = nothing # spec type: Union{ Nothing, Vector{SimulationStatus} }

    function Store(simulations, statuses)
        OpenAPI.validate_property(Store, Symbol("simulations"), simulations)
        OpenAPI.validate_property(Store, Symbol("statuses"), statuses)
        return new(simulations, statuses)
    end
end # type Store

const _property_types_Store = Dict{Symbol, String}(
    Symbol("simulations") => "Vector{Simulation}",
    Symbol("statuses") => "Vector{SimulationStatus}",
)
OpenAPI.property_type(::Type{Store}, name::Symbol) =
    Union{Nothing, eval(Base.Meta.parse(_property_types_Store[name]))}

function check_required(o::Store)
    o.simulations === nothing && (return false)
    o.statuses === nothing && (return false)
    true
end

function OpenAPI.validate_property(::Type{Store}, name::Symbol, val) end
