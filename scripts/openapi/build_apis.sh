#!/bin/bash
spec_file=src/openapi.yaml
docker run \
    -v $(pwd)/src:/src \
    openapitools/openapi-generator-cli:v6.6.0 \
    validate \
    -i ${spec_file}

if [[ $? -ne 0 ]]; then
    echo "Failed to validate ${spec_file}"
    exit 1
fi

bash scripts/openapi/build_server_api.sh
if [[ $? -ne 0 ]]; then
    echo "Failed to build the server API"
    exit 1
fi

julia scripts/formatter/formatter_code.jl src/api_server/src
bash scripts/openapi/build_python_client.sh
if [[ $? -ne 0 ]]; then
    echo "Failed to build the Python client"
    exit 1
fi
