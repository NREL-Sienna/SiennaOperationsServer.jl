#!/bin/bash
rm -rf python_client
PYTHON_CLIENT=python_client
java -jar ~/tools/swagger-codegen-cli.jar generate -i src/openapi.yaml -l python -o ${PYTHON_CLIENT}
# Workaround for this issue: https://github.com/swagger-api/swagger-codegen/issues/9991
# It is fixed in the openapi-generator, but that doesn't work with our openapi.yaml - and haven't
# debugged it.
sed -i .bk "s/def __del__/def close/" ${PYTHON_CLIENT}/swagger_client/api_client.py
