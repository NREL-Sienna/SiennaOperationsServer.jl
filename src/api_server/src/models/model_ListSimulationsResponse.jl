# This file was generated by the Julia OpenAPI Code Generator
# Do not modify this file directly. Modify the OpenAPI specification instead.


@doc raw"""
    ListSimulationsResponse(;
        simulations=nothing,
    )

    - simulations::Vector{Simulation}
"""
Base.@kwdef mutable struct ListSimulationsResponse <: OpenAPI.APIModel
    simulations::Union{Nothing, Vector} = nothing # spec type: Union{ Nothing, Vector{Simulation} }

    function ListSimulationsResponse(simulations, )
        OpenAPI.validate_property(ListSimulationsResponse, Symbol("simulations"), simulations)
        return new(simulations, )
    end
end # type ListSimulationsResponse

const _property_types_ListSimulationsResponse = Dict{Symbol,String}(Symbol("simulations")=>"Vector{Simulation}", )
OpenAPI.property_type(::Type{ ListSimulationsResponse }, name::Symbol) = Union{Nothing,eval(Base.Meta.parse(_property_types_ListSimulationsResponse[name]))}

function check_required(o::ListSimulationsResponse)
    o.simulations === nothing && (return false)
    true
end

function OpenAPI.validate_property(::Type{ ListSimulationsResponse }, name::Symbol, val)
end