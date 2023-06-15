import json
import time
from pathlib import Path

import polars as pl
import swagger_client
from swagger_client.rest import ApiException
from swagger_client.models.simulation import Simulation

config = swagger_client.Configuration()
config.host = "http://localhost:8081"
api = swagger_client.DefaultApi(swagger_client.ApiClient(config))

data = json.loads((Path("examples") / "simulation.json").read_text())
sim = Simulation(**data)
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
        name = response.name
        status = response.status
        progress_events = response.progress_events
        print(f"{name=} {status=}")
        print(f"{progress_events=}")
        time.sleep(3)
print(f"Simulation is complete. {response=}")
print("Print results for ActivePowerVariable__ThermalStandard.")
api.cache_simulation_results(1)
data = api.read_realized_variable_results(1, "ed", "ActivePowerVariable__ThermalStandard")
df = pl.DataFrame(data)
print(df)
data = api.read_optimizer_stats(1, "ed")
df = pl.DataFrame(data)
print(f"optimizer_stats: {df}")
