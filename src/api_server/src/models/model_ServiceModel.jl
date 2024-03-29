# This file was generated by the Julia OpenAPI Code Generator
# Do not modify this file directly. Modify the OpenAPI specification instead.


@doc raw"""
    ServiceModel(;
        service_type=nothing,
        formulation=nothing,
    )

    - service_type::String
    - formulation::String
"""
Base.@kwdef mutable struct ServiceModel <: OpenAPI.APIModel
    service_type::Union{Nothing, String} = nothing
    formulation::Union{Nothing, String} = nothing

    function ServiceModel(service_type, formulation, )
        OpenAPI.validate_property(ServiceModel, Symbol("service_type"), service_type)
        OpenAPI.validate_property(ServiceModel, Symbol("formulation"), formulation)
        return new(service_type, formulation, )
    end
end # type ServiceModel

const _property_types_ServiceModel = Dict{Symbol,String}(Symbol("service_type")=>"String", Symbol("formulation")=>"String", )
OpenAPI.property_type(::Type{ ServiceModel }, name::Symbol) = Union{Nothing,eval(Base.Meta.parse(_property_types_ServiceModel[name]))}

function check_required(o::ServiceModel)
    true
end

function OpenAPI.validate_property(::Type{ ServiceModel }, name::Symbol, val)
end
