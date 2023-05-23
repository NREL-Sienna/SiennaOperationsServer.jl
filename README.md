# SiennaOperationsServer.jl

[![Master - CI](https://github.com/NREL-Sienna/Sienna-PACKAGE.jl/workflows/Master%20-%20CI/badge.svg)](https://github.com/NREL-Sienna/Sienna-PACKAGE.jl/actions/workflows/main-tests.yml)
[![codecov](https://codecov.io/gh/NREL-Sienna/Sienna-PACKAGE.jl/branch/master/graph/badge.svg)](https://codecov.io/gh/NREL-SIIP/SIIP-PACKAGE.jl)
[![Documentation Build](https://github.com/NREL-Sienna/Sienna-PACKAGE.jl/workflows/Documentation/badge.svg?)](https://nrel-sienna.github.io/Sienna-PACKAGE.jl/stable)
[<img src="https://img.shields.io/badge/slack-@Sienna/SiennaPACKAGE-sienna.svg?logo=slack">](https://join.slack.com/t/nrel-siip/shared_invite/zt-glam9vdu-o8A9TwZTZqqNTKHa7q3BpQ)
[![Sienna-PACKAGE.jl Downloads](https://shields.io/endpoint?url=https://pkgs.genieframework.com/api/v1/badge/SIIP-PACKAGE)](https://pkgs.genieframework.com?packages=Sienna-PACKAGE)

`SiennaOperationsServer.jl` is a Julia package that implements a server with an HTTP interface that
allows non-Julia clients to run simulations and process results.

The HTTP API conforms to the OpenAPI 3.0 specification. Please refer to  for more information about OpenAPI.

The commands below demonstrate how to generate server and client code for the API. You can install
the code generated with this command:
```
$ npm install -g @openapitools/openapi-generator-cli
```

The specification can be validated with this command:
```
$ openapi-generator-cli validate -i src/openapi.yaml
```

The Julia server API code can be auto-generated with this command:
```
$ openapi-generator-cli generate \
    -i src/openapi.yaml \
    -g julia-server \
    -o src/api_server \
    --additional-properties=packageName=ApiServer \
    --additional-properties=exportModels=true
```

A Python client can be generated with this command:
```
$ openapi-generator-cli generate -i src/openapi.yaml -g python -o python_client
```

## Development

Contributions to the development and enahancement of Sienna-PACKAGE is welcome. Please see [CONTRIBUTING.md](https://github.com/NREL-Sienna/Sienna-PACKAGE.jl/blob/master/CONTRIBUTING.md) for code contribution guidelines.

## License

`SiennaOperationsServer` is released under a BSD [license](https://github.com/NREL-Sienna/SiennaOperationsServer.jl/blob/master/LICENSE).SiennaOperationsServer has been developed as part of A PROJECT at the U.S. Department of Energy's National Renewable Energy Laboratory ([NREL](https://www.nrel.gov/))
