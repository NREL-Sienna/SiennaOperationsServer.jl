#project_path = get(ENV, "POWER_SIMULATIONS_SERVER_PATH", nothing)
#if isnothing(project_path)
#    error("Please set the environment variable POWER_SIMULATIONS_SERVER_PATH to the path to your repository.")
#end
#import Pkg
#Pkg.activate(project_path)
using Distributed
using HTTP
using PowerSimulationsServer
import InfrastructureSystems
import PowerSimulations
import PowerSystems
import PowerSystemCaseBuilder
using HiGHS
import JuMP
const IS = InfrastructureSystems
const PSB = PowerSystemCaseBuilder
const PSI = PowerSimulations
const PSY = PowerSystems
