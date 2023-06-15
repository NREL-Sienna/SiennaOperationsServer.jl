# This file was generated by the Julia OpenAPI Code Generator
# Do not modify this file directly. Modify the OpenAPI specification instead.


@doc raw"""
    EnergyLimitFeedforward(;
        component_type=nothing,
        source=nothing,
        affected_values=nothing,
        number_of_periods=nothing,
        feedforward_type=nothing,
    )

    - component_type::String
    - source::String
    - affected_values::Vector{String}
    - number_of_periods::Int64
    - feedforward_type::String
"""
Base.@kwdef mutable struct EnergyLimitFeedforward <: OpenAPI.APIModel
    component_type::Union{Nothing, String} = nothing
    source::Union{Nothing, String} = nothing
    affected_values::Union{Nothing, Vector{String}} = nothing
    number_of_periods::Union{Nothing, Int64} = nothing
    feedforward_type::Union{Nothing, String} = nothing

    function EnergyLimitFeedforward(component_type, source, affected_values, number_of_periods, feedforward_type, )
        OpenAPI.validate_property(EnergyLimitFeedforward, Symbol("component_type"), component_type)
        OpenAPI.validate_property(EnergyLimitFeedforward, Symbol("source"), source)
        OpenAPI.validate_property(EnergyLimitFeedforward, Symbol("affected_values"), affected_values)
        OpenAPI.validate_property(EnergyLimitFeedforward, Symbol("number_of_periods"), number_of_periods)
        OpenAPI.validate_property(EnergyLimitFeedforward, Symbol("feedforward_type"), feedforward_type)
        return new(component_type, source, affected_values, number_of_periods, feedforward_type, )
    end
end # type EnergyLimitFeedforward

const _property_types_EnergyLimitFeedforward = Dict{Symbol,String}(Symbol("component_type")=>"String", Symbol("source")=>"String", Symbol("affected_values")=>"Vector{String}", Symbol("number_of_periods")=>"Int64", Symbol("feedforward_type")=>"String", )
OpenAPI.property_type(::Type{ EnergyLimitFeedforward }, name::Symbol) = Union{Nothing,eval(Base.Meta.parse(_property_types_EnergyLimitFeedforward[name]))}

function check_required(o::EnergyLimitFeedforward)
    o.component_type === nothing && (return false)
    o.source === nothing && (return false)
    o.affected_values === nothing && (return false)
    o.number_of_periods === nothing && (return false)
    o.feedforward_type === nothing && (return false)
    true
end

function OpenAPI.validate_property(::Type{ EnergyLimitFeedforward }, name::Symbol, val)
end
