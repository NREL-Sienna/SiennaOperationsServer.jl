# This file was generated by the Julia OpenAPI Code Generator
# Do not modify this file directly. Modify the OpenAPI specification instead.

@doc raw"""
    Feedforwards(;
        model_name=nothing,
        feedforwards=nothing,
    )

    - model_name::String
    - feedforwards::Vector{AbstractFeedforward}
"""
Base.@kwdef mutable struct Feedforwards <: OpenAPI.APIModel
    model_name::Union{Nothing, String} = nothing
    feedforwards::Union{Nothing, Vector} = nothing # spec type: Union{ Nothing, Vector{AbstractFeedforward} }

    function Feedforwards(model_name, feedforwards)
        OpenAPI.validate_property(Feedforwards, Symbol("model_name"), model_name)
        OpenAPI.validate_property(Feedforwards, Symbol("feedforwards"), feedforwards)
        return new(model_name, feedforwards)
    end
end # type Feedforwards

const _property_types_Feedforwards = Dict{Symbol, String}(
    Symbol("model_name") => "String",
    Symbol("feedforwards") => "Vector{AbstractFeedforward}",
)
OpenAPI.property_type(::Type{Feedforwards}, name::Symbol) =
    Union{Nothing, eval(Base.Meta.parse(_property_types_Feedforwards[name]))}

function check_required(o::Feedforwards)
    o.model_name === nothing && (return false)
    o.feedforwards === nothing && (return false)
    true
end

function OpenAPI.validate_property(::Type{Feedforwards}, name::Symbol, val) end
