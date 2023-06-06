#!/bin/bash
rm -rf src/api_server
openapi-generator-cli generate \
    -i src/openapi.yaml \
    -g julia-server \
    -o src/api_server \
    --additional-properties=packageName=ApiServer \
    --additional-properties=exportModels=true
