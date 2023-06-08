abstract type SiennaOperationsServerException <: Exception end

struct DuplicateValueError <: SiennaOperationsServerException end

struct NotFoundError <: SiennaOperationsServerException end

struct TooManyRequestsErorr <: SiennaOperationsServerException end

function map_exception_to_http_error_code(exc::SiennaOperationsServerException)
    if exc isa NotFoundError
        return 404
    elseif exc isa DuplicateValueError
        return 409
    elseif exc isa TooManyRequestsErorr
        return 429
    else
        return 400
    end
end

map_exception_to_http_error_code(exc::Exception) = 400

macro map_exceptions_to_http(expr::Expr)
    return :(
        try
            return $(esc(expr))
        catch e
            code = map_exception_to_http_error_code(e)
            return HTTP.Response(code, string(e))
        end
    )
end
