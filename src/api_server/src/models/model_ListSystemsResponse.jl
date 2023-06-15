# This file was generated by the Julia OpenAPI Code Generator
# Do not modify this file directly. Modify the OpenAPI specification instead.

@doc raw"""
    ListSystemsResponse(;
        systems=nothing,
    )

    - systems::Vector{System}
"""
Base.@kwdef mutable struct ListSystemsResponse <: OpenAPI.APIModel
    systems::Union{Nothing, Vector} = nothing # spec type: Union{ Nothing, Vector{System} }

    function ListSystemsResponse(systems)
        OpenAPI.validate_property(ListSystemsResponse, Symbol("systems"), systems)
        return new(systems)
    end
end # type ListSystemsResponse

const _property_types_ListSystemsResponse =
    Dict{Symbol, String}(Symbol("systems") => "Vector{System}")
OpenAPI.property_type(::Type{ListSystemsResponse}, name::Symbol) =
    Union{Nothing, eval(Base.Meta.parse(_property_types_ListSystemsResponse[name]))}

function check_required(o::ListSystemsResponse)
    o.systems === nothing && (return false)
    true
end

function OpenAPI.validate_property(::Type{ListSystemsResponse}, name::Symbol, val) end
