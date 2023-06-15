#!/bin/bash

rm -rf python_client
docker run \
    -v $(pwd)/src:/src -v $(pwd)/python_client:/python_client \
    swaggerapi/swagger-codegen-cli-v3:3.0.46 \
    generate -i /src/openapi.yaml -l python -o /python_client

if [[ $? -ne 0 ]]; then
    echo "Failed to run the Swagger code generator: $?"
    exit 1
fi

# Workaround for this issue: https://github.com/swagger-api/swagger-codegen/issues/9991
# It is fixed in the openapi-generator, but that doesn't work with our openapi.yaml - and haven't
# debugged it.
sed -i .bk "s/def __del__/def close/" python_client/swagger_client/api_client.py
