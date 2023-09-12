function make_cbc_optimizer()
    try
        @eval Main begin
            import Cbc
            return Cbc.Optimizer
        end
    catch
        error("The Cbc optimizer must be installed.")
    end
end

function make_cplex_optimizer()
    try
        @eval Main begin
            import CPLEX
            return CPLEX.Optimizer
        end
    catch
        error("The CPLEX optimizer must be installed.")
    end
end

function make_glpk_optimizer()
    try
        @eval Main begin
            import GLPK
            return GLPK.Optimizer
        end
    catch
        error("The GLPK optimizer must be installed.")
    end
end

function make_gurobi_optimizer()
    try
        @eval Main begin
            import Gurobi
            return Gurobi.Optimizer
        end
    catch
        error("The Gurobi optimizer must be installed.")
    end
end

function make_highs_optimizer()
    try
        @eval Main begin
            import HiGHS
            return HiGHS.Optimizer
        end
    catch
        error("The HiGHS optimizer must be installed.")
    end
end

function make_ipopt_optimizer()
    try
        @eval Main begin
            import Ipopt
            return Ipopt.Optimizer
        end
    catch
        error("The Ipopt optimizer must be installed.")
    end
end

function make_scs_optimizer()
    try
        @eval Main begin
            import SCS
            return SCS.Optimizer
        end
    catch
        error("The SCS optimizer must be installed.")
    end
end

function make_xpress_optimizer()
    try
        @eval Main begin
            import Xpress
            return Xpress.Optimizer
        end
    catch
        error("The Xpress optimizer must be installed.")
    end
end

const _OPTIMIZER_MAP = Dict(
    "cbc" => make_cbc_optimizer,
    "cplex" => make_cplex_optimizer,
    "glpk" => make_glpk_optimizer,
    "gurobi" => make_gurobi_optimizer,
    "highs" => make_highs_optimizer,
    "ipopt" => make_ipopt_optimizer,
    "scs" => make_scs_optimizer,
    "xpress" => make_xpress_optimizer,
)

function make_optimizer(optimizer_type::String)
    if !haskey(_OPTIMIZER_MAP, optimizer_type)
        error("optimizer_type = $optimizer_type is invalid")
    end
    return _OPTIMIZER_MAP[optimizer_type]()
end
