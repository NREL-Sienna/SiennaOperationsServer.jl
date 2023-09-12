using Pkg
Pkg.activate(@__DIR__)
Pkg.instantiate()
using JuliaFormatter

format_kwargs = Dict(
    :whitespace_ops_in_indices => true,
    :remove_extra_newlines => true,
    :verbose => true,
    :always_for_in => true,
    :whitespace_typedefs => true,
    :whitespace_in_kwargs => false,
    :format_docstrings => true,
    :always_use_return => false, # removed since it has false positives.
)

paths = isempty(ARGS) ? ["."] : ARGS
for path in paths
    format(path; format_kwargs...)
end

if !isempty(ARGS)
    # Documentation Formatter
    for path in ["./docs/src"]
        for folder in readdir(path)
            folder_path = joinpath(path, folder)
            if isfile(folder_path)
                !occursin(".md", folder_path) && continue
            end
            format(folder_path; format_markdown=true, format_kwargs...)
        end
    end
end
