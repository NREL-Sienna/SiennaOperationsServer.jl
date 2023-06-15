# This file was generated by the Julia OpenAPI Code Generator
# Do not modify this file directly. Modify the OpenAPI specification instead.



@doc raw"""
    AbstractOptimizer(; value=nothing)
"""
mutable struct AbstractOptimizer <: OpenAPI.OneOfAPIModel
    value::Any # Union{ CbcOptimizer, CplexOptimizer, GlpkOptimizer, GurobiOptimizer, HighsOptimizer, IpoptOptimizer, ScsOptimizer, XpressOptimizer }
    AbstractOptimizer() = new()
    AbstractOptimizer(value) = new(value)
end # type AbstractOptimizer

function OpenAPI.property_type(::Type{ AbstractOptimizer }, name::Symbol, json::Dict{String,Any})
    discriminator = json["optimizer_type"]
    if discriminator == "CbcOptimizer"
        return eval(Base.Meta.parse("CbcOptimizer"))
    elseif discriminator == "CplexOptimizer"
        return eval(Base.Meta.parse("CplexOptimizer"))
    elseif discriminator == "GlpkOptimizer"
        return eval(Base.Meta.parse("GlpkOptimizer"))
    elseif discriminator == "GurobiOptimizer"
        return eval(Base.Meta.parse("GurobiOptimizer"))
    elseif discriminator == "HighsOptimizer"
        return eval(Base.Meta.parse("HighsOptimizer"))
    elseif discriminator == "IpoptOptimizer"
        return eval(Base.Meta.parse("IpoptOptimizer"))
    elseif discriminator == "ScsOptimizer"
        return eval(Base.Meta.parse("ScsOptimizer"))
    elseif discriminator == "XpressOptimizer"
        return eval(Base.Meta.parse("XpressOptimizer"))
    end
    throw(OpenAPI.ValidationException("Invalid discriminator value: $discriminator for AbstractOptimizer"))
end
