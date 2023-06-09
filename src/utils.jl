function _convert_string_to_type(modules::Array{Module}, name)
    for m in modules
        if hasproperty(m, Symbol(name))
            return _convert_string_to_type(m, name)
        end
    end
end

function _convert_string_to_type(mod, name)
    indexes = findall('{', name)
    if isempty(indexes)
        return getproperty(mod, Symbol(name))
    end

    if length(indexes) > 1
        error("Types with more than one level of parameterization is not supported: $name")
    end
    name[end] != '}' && error("Parametric type $name does not end with '}'")

    base_type = getproperty(mod, Symbol(name[1:(indexes[1] - 1)]))
    substring = name[(indexes[1] + 1):(end - 1)]
    parametric_types = [getproperty(mod, Symbol(strip(x))) for x in split(substring, ",")]
    return base_type{parametric_types...}
end
