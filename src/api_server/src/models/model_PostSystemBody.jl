# This file was generated by the Julia OpenAPI Code Generator
# Do not modify this file directly. Modify the OpenAPI specification instead.


@doc raw"""
    PostSystemBody(;
        path=nothing,
    )

    - path::String
"""
Base.@kwdef mutable struct PostSystemBody <: OpenAPI.APIModel
    path::Union{Nothing, String} = nothing

    function PostSystemBody(path, )
        OpenAPI.validate_property(PostSystemBody, Symbol("path"), path)
        return new(path, )
    end
end # type PostSystemBody

const _property_types_PostSystemBody = Dict{Symbol,String}(Symbol("path")=>"String", )
OpenAPI.property_type(::Type{ PostSystemBody }, name::Symbol) = Union{Nothing,eval(Base.Meta.parse(_property_types_PostSystemBody[name]))}

function check_required(o::PostSystemBody)
    o.path === nothing && (return false)
    true
end

function OpenAPI.validate_property(::Type{ PostSystemBody }, name::Symbol, val)
end
