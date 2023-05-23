_make_system(val::ApiServer.SystemPath; kwargs...) = PSY.System(val.path; kwargs...)
_make_system(case::ApiServer.SystemCase; kwargs...) =
    _make_system_from_case(case; kwargs...)

function make_system_from_case(category::String, name::String; kwargs...)
    psb_category = getproperty(PSB, Symbol(category))
    return PSB.build_system(psb_category, name; kwargs...)
end
