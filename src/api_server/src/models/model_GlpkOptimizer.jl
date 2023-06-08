# This file was generated by the Julia OpenAPI Code Generator
# Do not modify this file directly. Modify the OpenAPI specification instead.


@doc raw"""
    GlpkOptimizer(;
        optimizer_type=nothing,
        msg_level=0,
    )

    - optimizer_type::String
    - msg_level::Int64
"""
Base.@kwdef mutable struct GlpkOptimizer <: OpenAPI.APIModel
    optimizer_type::Union{Nothing, String} = nothing
    msg_level::Union{Nothing, Int64} = 0

    function GlpkOptimizer(optimizer_type, msg_level, )
        OpenAPI.validate_property(GlpkOptimizer, Symbol("optimizer_type"), optimizer_type)
        OpenAPI.validate_property(GlpkOptimizer, Symbol("msg_level"), msg_level)
        return new(optimizer_type, msg_level, )
    end
end # type GlpkOptimizer

const _property_types_GlpkOptimizer = Dict{Symbol,String}(Symbol("optimizer_type")=>"String", Symbol("msg_level")=>"Int64", )
OpenAPI.property_type(::Type{ GlpkOptimizer }, name::Symbol) = Union{Nothing,eval(Base.Meta.parse(_property_types_GlpkOptimizer[name]))}

function check_required(o::GlpkOptimizer)
    o.optimizer_type === nothing && (return false)
    true
end

function OpenAPI.validate_property(::Type{ GlpkOptimizer }, name::Symbol, val)
end
