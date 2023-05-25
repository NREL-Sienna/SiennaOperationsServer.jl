#!/bin/bash

if [ -z "${SWAGGER_CODEGEN_CLI}" ]; then
    echo "Please define the environment variable SWAGGER_CODEGEN_CLI."
    echo "Example:"
    echo "$ export SWAGGER_CODEGEN_CLI=\"java -jar swagger-codegen-cli.jar\""
    exit 1
fi
rm -rf python_client
PYTHON_CLIENT=python_client
${SWAGGER_CODEGEN_CLI} generate -i src/openapi.yaml -l python -o ${PYTHON_CLIENT}
if [[ $? -ne 0 ]]; then
    echo "Failed to run the Swagger code generator: $?"
    exit 1
fi

# Workaround for this issue: https://github.com/swagger-api/swagger-codegen/issues/9991
# It is fixed in the openapi-generator, but that doesn't work with our openapi.yaml - and haven't
# debugged it.
sed -i .bk "s/def __del__/def close/" ${PYTHON_CLIENT}/swagger_client/api_client.py
