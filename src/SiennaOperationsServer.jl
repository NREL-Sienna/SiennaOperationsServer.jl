module SiennaOperationsServer

using DocStringExtensions
using Dates
using Distributed
import HTTP
import JSON3
import JSONTables
import Logging
import OpenAPI
import InfrastructureSystems
import PowerSimulations
import PowerSystems
import PowerSystemCaseBuilder
import JuMP
const IS = InfrastructureSystems
const PSB = PowerSystemCaseBuilder
const PSI = PowerSimulations
const PSY = PowerSystems

@template (FUNCTIONS, METHODS) = """
                                 $(TYPEDSIGNATURES)
                                 $(DOCSTRING)
                                 """

include("api_server/src/ApiServer.jl")
import .ApiServer

include("common.jl")
include("exceptions.jl")
include("utils.jl")
include("system.jl")
include("optimizers.jl")
include("simulation.jl")
include("manager.jl")
include("server.jl")

export run_server

end
