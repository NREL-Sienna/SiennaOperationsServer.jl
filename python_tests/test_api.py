"""Test workflows with the API."""

import json
import subprocess
import time
from pathlib import Path

import pytest
import polars as pl
import requests
import swagger_client
from swagger_client.models.simulation import Simulation


@pytest.fixture(scope="session")
def initialize_api_and_store():
    """Create an API client and then run a simulation to populate the store."""
    api = None
    url = "http://localhost:8081"
    cmd = ["julia", "-p1", "--project", "-L", "src/init_worker.jl", "src/run_server.jl"]
    with subprocess.Popen(cmd, stdout=subprocess.PIPE, stderr=subprocess.STDOUT) as pipe:
        started = False
        start_time = time.time()
        timeout = start_time + 120
        config = swagger_client.Configuration()
        config.host = url
        api = swagger_client.DefaultApi(swagger_client.ApiClient(config))
        while not started:
            time.sleep(5)
            try:
                api.list_simulations()
                started = True
                print("The server is now running.")
            except Exception:
                print("The server is not running yet.")
        assert time.time() < timeout
        # This will populate the store for tests.
        _run_simulation(api)
        yield api
        if api is not None:
            api.api_client.close()
        try:
            requests.get(f"{url}/stop")
        except requests.ConnectionError:
            pass
        return_code = None
        for _ in range(5):
            if pipe.poll() is not None:
                return_code = pipe.returncode
                break
            time.sleep(1)
        if return_code is None:
            pipe.kill()


def test_list_commands(initialize_api_and_store):
    """Test the list system and simulation commands."""
    api = initialize_api_and_store
    assert len(api.list_systems().systems) == 0
    assert len(api.list_simulations().simulations) == 0
    response = api.list_simulation_statuses()
    assert len(response.statuses) == 1
    sim_id = response.statuses[0].simulation_id
    response2 = api.get_simulation_status(sim_id)
    assert response.statuses[0].status == response2.status
    assert response.statuses[0].status == "done"


def test_simulation_results(initialize_api_and_store):
    """Test collection of simulation results."""
    api = initialize_api_and_store
    response = api.list_simulation_statuses()
    assert len(response.statuses) == 1
    sim_id = response.statuses[0].simulation_id
    api.cache_simulation_results(sim_id)
    try:
        response = api.list_decision_problems(sim_id)
        for problem_name in response.names:
            for list_method, read_method in (
                ("list_aux_variable_names", "read_realized_aux_variable_results"),
                ("list_dual_names", "read_realized_dual_variable_results"),
                ("list_expression_names", "read_realized_expression_results"),
                ("list_parameter_names", "read_realized_parameter_results"),
                ("list_variable_names", "read_realized_variable_results"),
            ):
                for name in getattr(api, list_method)(sim_id, problem_name).names:
                    data = getattr(api, read_method)(sim_id, problem_name, name)
                    df = pl.DataFrame(data)
                    assert isinstance(df, pl.DataFrame)
    finally:
        api.discard_simulation_results(sim_id)


def test_post_system_case(initialize_api_and_store):
    """Test the creation of a system with PowerSystemCaseBuilder."""
    api = initialize_api_and_store
    system = api.post_system_case("PSITestSystems", "test_RTS_GMLC_sys")
    assert system.uuid
    assert len(api.list_systems().systems) == 1
    api.delete_system(system.uuid)
    assert len(api.list_systems().systems) == 0


def test_post_simulation(initialize_api_and_store):
    """Test the creation of a power simulation."""
    api = initialize_api_and_store
    sim = _read_simulation(Path("examples") / "simulation.json")
    api.post_simulation(sim)
    assert len(api.list_simulations().simulations) == 1
    api.delete_simulation(sim.name)
    assert len(api.list_simulations().simulations) == 0


def test_save_load_data(initialize_api_and_store):
    """Test the export and load of the store's data."""
    api = initialize_api_and_store
    data = api.get_store()
    assert len(api.list_simulation_statuses().statuses) == 1
    api.delete_store()
    assert len(api.list_simulation_statuses().statuses) == 0
    api.load_store(data)
    assert len(api.list_simulation_statuses().statuses) == 1


def _read_simulation(filename: Path):
    data = json.loads(filename.read_text())
    return Simulation(**data)


def _run_simulation(api):
    sim = _read_simulation(Path("examples") / "simulation.json")
    response = api.start_simulation(sim, output_dir="output_dir", poll_interval=3)
    simulation_id = response.status.simulation_id
    print(f"Started simulation {simulation_id=}")
    done = False
    response = None
    while not done:
        response = api.get_simulation_status(simulation_id)
        if response.status == "done":
            done = True
        else:
            time.sleep(3)
    print(f"Simulation is complete. {response=}")
