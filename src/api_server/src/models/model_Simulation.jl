# This file was generated by the Julia OpenAPI Code Generator
# Do not modify this file directly. Modify the OpenAPI specification instead.


@doc raw"""
    Simulation(;
        name=nothing,
        models=nothing,
        sequence=nothing,
        num_steps=1,
        initial_time=nothing,
    )

    - name::String
    - models::SimulationModels
    - sequence::SimulationSequence
    - num_steps::Int64
    - initial_time::String
"""
Base.@kwdef mutable struct Simulation <: OpenAPI.APIModel
    name::Union{Nothing, String} = nothing
    models = nothing # spec type: Union{ Nothing, SimulationModels }
    sequence = nothing # spec type: Union{ Nothing, SimulationSequence }
    num_steps::Union{Nothing, Int64} = 1
    initial_time::Union{Nothing, String} = nothing

    function Simulation(name, models, sequence, num_steps, initial_time, )
        OpenAPI.validate_property(Simulation, Symbol("name"), name)
        OpenAPI.validate_property(Simulation, Symbol("models"), models)
        OpenAPI.validate_property(Simulation, Symbol("sequence"), sequence)
        OpenAPI.validate_property(Simulation, Symbol("num_steps"), num_steps)
        OpenAPI.validate_property(Simulation, Symbol("initial_time"), initial_time)
        return new(name, models, sequence, num_steps, initial_time, )
    end
end # type Simulation

const _property_types_Simulation = Dict{Symbol,String}(Symbol("name")=>"String", Symbol("models")=>"SimulationModels", Symbol("sequence")=>"SimulationSequence", Symbol("num_steps")=>"Int64", Symbol("initial_time")=>"String", )
OpenAPI.property_type(::Type{ Simulation }, name::Symbol) = Union{Nothing,eval(Base.Meta.parse(_property_types_Simulation[name]))}

function check_required(o::Simulation)
    o.name === nothing && (return false)
    o.models === nothing && (return false)
    o.sequence === nothing && (return false)
    true
end

function OpenAPI.validate_property(::Type{ Simulation }, name::Symbol, val)
end
