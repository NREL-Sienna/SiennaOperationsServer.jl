# This file was generated by the Julia OpenAPI Code Generator
# Do not modify this file directly. Modify the OpenAPI specification instead.


@doc raw"""
    Attribute(;
        key=nothing,
        val=nothing,
    )

    - key::String
    - val::Any
"""
Base.@kwdef mutable struct Attribute <: OpenAPI.APIModel
    key::Union{Nothing, String} = nothing
    val::Union{Nothing, Any} = nothing

    function Attribute(key, val, )
        OpenAPI.validate_property(Attribute, Symbol("key"), key)
        OpenAPI.validate_property(Attribute, Symbol("val"), val)
        return new(key, val, )
    end
end # type Attribute

const _property_types_Attribute = Dict{Symbol,String}(Symbol("key")=>"String", Symbol("val")=>"Any", )
OpenAPI.property_type(::Type{ Attribute }, name::Symbol) = Union{Nothing,eval(Base.Meta.parse(_property_types_Attribute[name]))}

function check_required(o::Attribute)
    o.key === nothing && (return false)
    o.val === nothing && (return false)
    true
end

function OpenAPI.validate_property(::Type{ Attribute }, name::Symbol, val)
end
