#!/bin/bash
rm -rf src/api_server
docker run \wa
    -v $(pwd)/src:/src \
    openapitools/openapi-generator-cli:v6.6.0 \
    generate \
    -i src/openapi.yaml \
    -g julia-server \
    -o src/api_server \
    --additional-properties=packageName=ApiServer \
    --additional-properties=exportModels=true

if [[ $? -ne 0 ]]; then
    echo "Failed to build the server API"
    exit 1
fi

julia scripts/formatter/formatter_code.jl src/api_server/src
