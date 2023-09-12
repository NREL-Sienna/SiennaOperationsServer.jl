# This file was generated by the Julia OpenAPI Code Generator
# Do not modify this file directly. Modify the OpenAPI specification instead.


@doc raw"""
    SystemCase(;
        category=nothing,
        name=nothing,
        descriptor_type=nothing,
    )

    - category::String
    - name::String
    - descriptor_type::String
"""
Base.@kwdef mutable struct SystemCase <: OpenAPI.APIModel
    category::Union{Nothing, String} = nothing
    name::Union{Nothing, String} = nothing
    descriptor_type::Union{Nothing, String} = nothing

    function SystemCase(category, name, descriptor_type, )
        OpenAPI.validate_property(SystemCase, Symbol("category"), category)
        OpenAPI.validate_property(SystemCase, Symbol("name"), name)
        OpenAPI.validate_property(SystemCase, Symbol("descriptor_type"), descriptor_type)
        return new(category, name, descriptor_type, )
    end
end # type SystemCase

const _property_types_SystemCase = Dict{Symbol,String}(Symbol("category")=>"String", Symbol("name")=>"String", Symbol("descriptor_type")=>"String", )
OpenAPI.property_type(::Type{ SystemCase }, name::Symbol) = Union{Nothing,eval(Base.Meta.parse(_property_types_SystemCase[name]))}

function check_required(o::SystemCase)
    o.category === nothing && (return false)
    o.name === nothing && (return false)
    o.descriptor_type === nothing && (return false)
    true
end

function OpenAPI.validate_property(::Type{ SystemCase }, name::Symbol, val)
end
