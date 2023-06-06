# SiennaOperationsServer.jl

[![Master - CI](https://github.com/NREL-Sienna/Sienna-PACKAGE.jl/workflows/Master%20-%20CI/badge.svg)](https://github.com/NREL-Sienna/Sienna-PACKAGE.jl/actions/workflows/main-tests.yml)
[![codecov](https://codecov.io/gh/NREL-Sienna/Sienna-PACKAGE.jl/branch/master/graph/badge.svg)](https://codecov.io/gh/NREL-SIIP/SIIP-PACKAGE.jl)
[![Documentation Build](https://github.com/NREL-Sienna/Sienna-PACKAGE.jl/workflows/Documentation/badge.svg?)](https://nrel-sienna.github.io/Sienna-PACKAGE.jl/stable)
[<img src="https://img.shields.io/badge/slack-@Sienna/SiennaPACKAGE-sienna.svg?logo=slack">](https://join.slack.com/t/nrel-siip/shared_invite/zt-glam9vdu-o8A9TwZTZqqNTKHa7q3BpQ)
[![Sienna-PACKAGE.jl Downloads](https://shields.io/endpoint?url=https://pkgs.genieframework.com/api/v1/badge/SIIP-PACKAGE)](https://pkgs.genieframework.com?packages=Sienna-PACKAGE)

`SiennaOperationsServer.jl` is a Julia package that implements a server with an HTTP interface that
allows non-Julia clients to run simulations and process results.

The HTTP API conforms to the OpenAPI 3.0 specification. Please refer to https://www.openapis.org/
for more information about OpenAPI.

We use the OpenAPI code generator to build the server library. Install it with this command:
```
$ npm install -g @openapitools/openapi-generator-cli
```

The OpenAPI generator for a Python client does not currently work and so we are using the
Swagger codegen utility instead. Follow the installation instructions at
https://swagger.io/docs/open-source-tools/swagger-codegen

The scripts to generate server and client code are at:
- `scripts/openapi/build_server_api.sh`
- `scripts/openapi/build_python_client.sh`

In order to build a distributable Python client package, follow these steps:
1. Edit the `packageVersion` in `scripts/openapi/config.json`.
2. Build the client.
```
$ scripts/openapi/build_python_client.sh
```
3. Create a Python wheel.
```
$ cd python_client
$ python -m pip install --upgrade build
$ python -m build
```
That should create `dist/swagger_client-<your-version>-py3-noe-any.whl`, which you can
install with pip:
```
$ pip install dist/*.whl
```

## Usage

### Start the server
1. Make a copy of `src/init_worker.jl` and change it to import the optimizer that you will use.

2. Choose the number simulations that you want to run in parallel. Consider your CPU and memory
resources as well as the number of CPUs that will be used by the optimizers. You will set the `-p`
option with this value in the command below in order to tell Julia to start worker processes.

3. Start the server with this command:
```
$ julia -p1 --project -L <your_init_worker.jl> src/run_server.jl
```

When you're ready to stop the server:
```
$ curl --silent -X GET http://localhost:8081/stop
```

### Send commands over HTTP with cURL
The simplest way to send commands to the server is with the CLI tool `curl`. The examples below
pretty-print the output with `jq`. It is optional, but you'll want to use it. You can download it
at https://stedolan.github.io/jq/download.

These examples work on Mac and Linux. Windows users need to adjust based on their shell.

#### Run a simulation
The file `examples/simulation.json` defines a simulation. This command passes the contents to the
server and tells it to run it.
```
$ curl --silent -X POST http://localhost:8081/simulations/start -d "$(cat examples/simulation.json)"
```
If you would like to customize the output directory or change the poll interval, you can pass these
options:
```
$ curl --silent -X POST http://localhost:8081/simulations/start\?output_dir\=output_dir\&poll_interval\=1 -d "$(cat examples/simulation.json)"
```

#### Check status
This command will report the status of all simulations:
```
$ curl --silent -X GET http://localhost:8081/simulations/statuses | jq .
```
This command will report the status of one simulation (simulation with ID=3):
```
$ curl --silent -X GET http://localhost:8081/simulations/3/status | jq .
```

### Send commands with Python
1. Build a python client library with Swagger. (This will soon be provided automatically.)
```
$ ./scripts/api/build_python_client.sh
```
That command will create the library at `./python_client`.

2. Create a virtual environment. Conda is recommended. This example installs the Polars
dataframe package, but you can use others if you prefer.
```
$ conda create -n sienna-client python=3.10
$ conda activate sienna-client
$ pip install -e python_client polars requests
```

3. Run a simulation.
```
$ python examples/run_simulation.py
Started simulation simulation_id=2
name='no_min_ed' status='running'
progress_events=[]
Simulation is complete. response={'exec_time_s': None,
 'name': 'no_min_ed',
 'path': 'output_dir/no_min_ed-2',
 'progress_events': [{'exec_time_s': 0.004354953765869141,
                      'index': 1,
                      'model_name': 'ed',
                      'step': 1,
                      'timestamp': '2024-01-01T00:00:00',
                      'wall_time': '2023-05-23T09:49:59.920'},
                     {'exec_time_s': 0.008686065673828125,
                      'index': 2,
                      'model_name': 'ed',
                      'step': 2,
                      'timestamp': '2024-01-02T00:00:00',
                      'wall_time': '2023-05-23T09:49:59.925'}],
 'return_code': None,
 'simulation_id': 2,
 'start_time': '2023-05-23T09:49:59.725',
 'status': 'done',
 'worker_pid': 2}
Print results for ActivePowerVariable__ThermalStandard.
shape: (48, 6)
┌───────────────────────┬──────┬──────────┬────────────┬────────────┬──────────┐
│ DateTime              ┆ Alta ┆ Brighton ┆ Park City  ┆ Solitude   ┆ Sundance │
│ ---                   ┆ ---  ┆ ---      ┆ ---        ┆ ---        ┆ ---      │
│ str                   ┆ f64  ┆ f64      ┆ f64        ┆ f64        ┆ f64      │
╞═══════════════════════╪══════╪══════════╪════════════╪════════════╪══════════╡
│ 2024-01-01T00:00:00.0 ┆ 40.0 ┆ 600.0    ┆ 170.0      ┆ 25.666065  ┆ 0.0      │
│ 2024-01-01T01:00:00.0 ┆ 40.0 ┆ 600.0    ┆ 52.11534   ┆ 0.0        ┆ 0.0      │
│ 2024-01-01T02:00:00.0 ┆ 40.0 ┆ 600.0    ┆ 30.22808   ┆ 0.0        ┆ 0.0      │
│ 2024-01-01T03:00:00.0 ┆ 40.0 ┆ 600.0    ┆ 3.448971   ┆ 0.0        ┆ 0.0      │
│ …                     ┆ …    ┆ …        ┆ …          ┆ …          ┆ …        │
│ 2024-01-02T20:00:00.0 ┆ 40.0 ┆ 600.0    ┆ 170.0      ┆ 183.225209 ┆ 0.0      │
│ 2024-01-02T21:00:00.0 ┆ 40.0 ┆ 600.0    ┆ 170.0      ┆ 134.964334 ┆ 0.0      │
│ 2024-01-02T22:00:00.0 ┆ 40.0 ┆ 600.0    ┆ 170.0      ┆ 86.001712  ┆ 0.0      │
│ 2024-01-02T23:00:00.0 ┆ 40.0 ┆ 600.0    ┆ 167.936055 ┆ 0.0        ┆ 0.0      │
└───────────────────────┴──────┴──────────┴────────────┴────────────┴──────────┘
```

## Development

Contributions to the development and enahancement of Sienna-PACKAGE is welcome. Please see [CONTRIBUTING.md](https://github.com/NREL-Sienna/Sienna-PACKAGE.jl/blob/master/CONTRIBUTING.md) for code contribution guidelines.

## License

`SiennaOperationsServer` is released under a BSD [license](https://github.com/NREL-Sienna/SiennaOperationsServer.jl/blob/master/LICENSE).SiennaOperationsServer has been developed as part of A PROJECT at the U.S. Department of Energy's National Renewable Energy Laboratory ([NREL](https://www.nrel.gov/))
