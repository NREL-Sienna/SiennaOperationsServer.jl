#!/bin/bash
rm -rf src/api_server
docker run \
    -v $(pwd)/src:/src \
    openapitools/openapi-generator-cli:v6.6.0 \
    generate \
    -i src/openapi.yaml \
    -g julia-server \
    -o src/api_server \
    --additional-properties=packageName=ApiServer \
    --additional-properties=exportModels=true
