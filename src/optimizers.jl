function make_optimizer(optimizer::ApiServer.CbcOptimizer)
    try
        @eval Main begin
            import Cbc
            return Cbc.Optimizer
        end
    catch
        error("The Cbc optimizer must be installed.")
    end
end

function make_optimizer(optimizer::ApiServer.CplexOptimizer)
    try
        @eval Main begin
            import CPLEX
            return CPLEX.Optimizer
        end
    catch
        error("The CPLEX optimizer must be installed.")
    end
end

function make_optimizer(optimizer::ApiServer.GlpkOptimizer)
    try
        @eval Main begin
            import GLPK
            return GLPK.Optimizer
        end
    catch
        error("The GLPK optimizer must be installed.")
    end
end

function make_optimizer(optimizer::ApiServer.GurobiOptimizer)
    try
        @eval Main begin
            import Gurobi
            return Gurobi.Optimizer
        end
    catch
        error("The Gurobi optimizer must be installed.")
    end
end

function make_optimizer(optimizer::ApiServer.HighsOptimizer)
    try
        @eval Main begin
            import HiGHS
            return HiGHS.Optimizer
        end
    catch
        error("The HiGHS optimizer must be installed.")
    end
end

function make_optimizer(optimizer::ApiServer.IpoptOptimizer)
    try
        @eval Main begin
            import Ipopt
            return Ipopt.Optimizer
        end
    catch
        error("The Ipopt optimizer must be installed.")
    end
end

function make_optimizer(optimizer::ApiServer.ScsOptimizer)
    try
        @eval Main begin
            import SCS
            return SCS.Optimizer
        end
    catch
        error("The SCS optimizer must be installed.")
    end
end

function make_optimizer(optimizer::ApiServer.XpressOptimizer)
    try
        @eval Main begin
            import Xpress
            return Xpress.Optimizer
        end
    catch
        error("The Xpress optimizer must be installed.")
    end
end
