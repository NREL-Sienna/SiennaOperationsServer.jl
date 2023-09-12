# swagger_client.DefaultApi

All URIs are relative to */*

Method | HTTP request | Description
------------- | ------------- | -------------
[**cache_simulation_results**](DefaultApi.md#cache_simulation_results) | **POST** /simulations/{id}/cache_results | Cache the results for a simulation.
[**cancel_simulation**](DefaultApi.md#cancel_simulation) | **POST** /simulations/{id}/cancel | Cancel a simulation.
[**delete_simulation**](DefaultApi.md#delete_simulation) | **DELETE** /simulations/{name} | Remove a stored simulation.
[**delete_simulations**](DefaultApi.md#delete_simulations) | **DELETE** /simulations | Delete all simulations.
[**delete_store**](DefaultApi.md#delete_store) | **DELETE** /store | Delete the contents of the data store.
[**delete_system**](DefaultApi.md#delete_system) | **DELETE** /systems/{uuid} | Remove a loaded power system.
[**delete_systems**](DefaultApi.md#delete_systems) | **DELETE** /systems | Delete all systems.
[**discard_simulation_results**](DefaultApi.md#discard_simulation_results) | **DELETE** /simulations/{id}/cache_results | Discard the cached results for a simulation.
[**get_simulation**](DefaultApi.md#get_simulation) | **GET** /simulations/{name} | Retrieve one simulation.
[**get_simulation_status**](DefaultApi.md#get_simulation_status) | **GET** /simulations/{id}/status | Get simulation status.
[**get_store**](DefaultApi.md#get_store) | **GET** /store | Get the contents of the data store.
[**get_system**](DefaultApi.md#get_system) | **GET** /systems/{uuid} | Retrieve one system.
[**list_aux_variable_names**](DefaultApi.md#list_aux_variable_names) | **GET** /simulations/{id}/problems/{problem_name}/aux_variables | Retrieve the aux_variable names in a decision problem.
[**list_cached_simulation_results**](DefaultApi.md#list_cached_simulation_results) | **GET** /simulations/cache_results | Return the simulations with cached results.
[**list_decision_problems**](DefaultApi.md#list_decision_problems) | **GET** /simulations/{id}/decision_problems | Retrieve the decision problem names in a simulation.
[**list_dual_names**](DefaultApi.md#list_dual_names) | **GET** /simulations/{id}/problems/{problem_name}/duals | Retrieve the dual names in a decision problem.
[**list_expression_names**](DefaultApi.md#list_expression_names) | **GET** /simulations/{id}/problems/{problem_name}/expressions | Retrieve the expression names in a decision problem.
[**list_parameter_names**](DefaultApi.md#list_parameter_names) | **GET** /simulations/{id}/problems/{problem_name}/parameters | Retrieve the parameter names in a decision problem.
[**list_simulation_statuses**](DefaultApi.md#list_simulation_statuses) | **GET** /simulations/statuses | Check status for all simulations.
[**list_simulations**](DefaultApi.md#list_simulations) | **GET** /simulations | Retrieve all simulations.
[**list_systems**](DefaultApi.md#list_systems) | **GET** /systems | Retrieve all systems.
[**list_variable_names**](DefaultApi.md#list_variable_names) | **GET** /simulations/{id}/problems/{problem_name}/variables | Retrieve the variable names in a decision problem.
[**load_store**](DefaultApi.md#load_store) | **POST** /store | Load saved data.
[**post_simulation**](DefaultApi.md#post_simulation) | **POST** /simulations | Store a power simulation.
[**post_system**](DefaultApi.md#post_system) | **POST** /systems | Load a power system from a file path.
[**post_system_case**](DefaultApi.md#post_system_case) | **POST** /systems/{category}/{name} | Load a power system with PowerSystemCaseBuilder.
[**read_optimizer_stats**](DefaultApi.md#read_optimizer_stats) | **GET** /simulations/{id}/problems/{problem_name}/otimizer_stats | Retrieve the optimizer stats for a problem.
[**read_realized_aux_variable_results**](DefaultApi.md#read_realized_aux_variable_results) | **GET** /simulations/{id}/problems/{problem_name}/aux_variables/{aux_variable_name}/realized_results | Retrieve the realized results for a aux_variable.
[**read_realized_dual_results**](DefaultApi.md#read_realized_dual_results) | **GET** /simulations/{id}/problems/{problem_name}/duals/{dual_name}/realized_results | Retrieve the realized results for a dual.
[**read_realized_expression_results**](DefaultApi.md#read_realized_expression_results) | **GET** /simulations/{id}/problems/{problem_name}/expressions/{expression_name}/realized_results | Retrieve the realized results for a expression.
[**read_realized_parameter_results**](DefaultApi.md#read_realized_parameter_results) | **GET** /simulations/{id}/problems/{problem_name}/parameters/{parameter_name}/realized_results | Retrieve the realized results for a parameter.
[**read_realized_variable_results**](DefaultApi.md#read_realized_variable_results) | **GET** /simulations/{id}/problems/{problem_name}/variables/{variable_name}/realized_results | Retrieve the realized results for a variable.
[**start_simulation**](DefaultApi.md#start_simulation) | **POST** /simulations/start | Start a power simulation.
[**start_stored_simulation**](DefaultApi.md#start_stored_simulation) | **POST** /simulations/{id}/start | Start a simulation that was previously stored.

# **cache_simulation_results**
> object cache_simulation_results(id)

Cache the results for a simulation.

Cache the results for a simulation.

### Example
```python
from __future__ import print_function
import time
import swagger_client
from swagger_client.rest import ApiException
from pprint import pprint

# create an instance of the API class
api_instance = swagger_client.DefaultApi()
id = 56 # int | Simulation ID

try:
    # Cache the results for a simulation.
    api_response = api_instance.cache_simulation_results(id)
    pprint(api_response)
except ApiException as e:
    print("Exception when calling DefaultApi->cache_simulation_results: %s\n" % e)
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **int**| Simulation ID | 

### Return type

**object**

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **cancel_simulation**
> object cancel_simulation(id)

Cancel a simulation.

Cancel a simulation

### Example
```python
from __future__ import print_function
import time
import swagger_client
from swagger_client.rest import ApiException
from pprint import pprint

# create an instance of the API class
api_instance = swagger_client.DefaultApi()
id = 56 # int | Simulation name

try:
    # Cancel a simulation.
    api_response = api_instance.cancel_simulation(id)
    pprint(api_response)
except ApiException as e:
    print("Exception when calling DefaultApi->cancel_simulation: %s\n" % e)
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **int**| Simulation name | 

### Return type

**object**

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **delete_simulation**
> object delete_simulation(name)

Remove a stored simulation.

Remove a stored simulation.

### Example
```python
from __future__ import print_function
import time
import swagger_client
from swagger_client.rest import ApiException
from pprint import pprint

# create an instance of the API class
api_instance = swagger_client.DefaultApi()
name = 'name_example' # str | Simulation name

try:
    # Remove a stored simulation.
    api_response = api_instance.delete_simulation(name)
    pprint(api_response)
except ApiException as e:
    print("Exception when calling DefaultApi->delete_simulation: %s\n" % e)
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **name** | **str**| Simulation name | 

### Return type

**object**

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **delete_simulations**
> object delete_simulations()

Delete all simulations.

Delete all simulations.

### Example
```python
from __future__ import print_function
import time
import swagger_client
from swagger_client.rest import ApiException
from pprint import pprint

# create an instance of the API class
api_instance = swagger_client.DefaultApi()

try:
    # Delete all simulations.
    api_response = api_instance.delete_simulations()
    pprint(api_response)
except ApiException as e:
    print("Exception when calling DefaultApi->delete_simulations: %s\n" % e)
```

### Parameters
This endpoint does not need any parameter.

### Return type

**object**

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **delete_store**
> object delete_store()

Delete the contents of the data store.

Delete the contents of the data store.

### Example
```python
from __future__ import print_function
import time
import swagger_client
from swagger_client.rest import ApiException
from pprint import pprint

# create an instance of the API class
api_instance = swagger_client.DefaultApi()

try:
    # Delete the contents of the data store.
    api_response = api_instance.delete_store()
    pprint(api_response)
except ApiException as e:
    print("Exception when calling DefaultApi->delete_store: %s\n" % e)
```

### Parameters
This endpoint does not need any parameter.

### Return type

**object**

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **delete_system**
> object delete_system(uuid)

Remove a loaded power system.

Remove a loaded power system.

### Example
```python
from __future__ import print_function
import time
import swagger_client
from swagger_client.rest import ApiException
from pprint import pprint

# create an instance of the API class
api_instance = swagger_client.DefaultApi()
uuid = 'uuid_example' # str | System UUID

try:
    # Remove a loaded power system.
    api_response = api_instance.delete_system(uuid)
    pprint(api_response)
except ApiException as e:
    print("Exception when calling DefaultApi->delete_system: %s\n" % e)
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **uuid** | **str**| System UUID | 

### Return type

**object**

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **delete_systems**
> object delete_systems()

Delete all systems.

Delete all systems.

### Example
```python
from __future__ import print_function
import time
import swagger_client
from swagger_client.rest import ApiException
from pprint import pprint

# create an instance of the API class
api_instance = swagger_client.DefaultApi()

try:
    # Delete all systems.
    api_response = api_instance.delete_systems()
    pprint(api_response)
except ApiException as e:
    print("Exception when calling DefaultApi->delete_systems: %s\n" % e)
```

### Parameters
This endpoint does not need any parameter.

### Return type

**object**

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **discard_simulation_results**
> object discard_simulation_results(id)

Discard the cached results for a simulation.

Discard the cached results for a simulation.

### Example
```python
from __future__ import print_function
import time
import swagger_client
from swagger_client.rest import ApiException
from pprint import pprint

# create an instance of the API class
api_instance = swagger_client.DefaultApi()
id = 56 # int | Simulation ID

try:
    # Discard the cached results for a simulation.
    api_response = api_instance.discard_simulation_results(id)
    pprint(api_response)
except ApiException as e:
    print("Exception when calling DefaultApi->discard_simulation_results: %s\n" % e)
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **int**| Simulation ID | 

### Return type

**object**

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **get_simulation**
> Simulation get_simulation(name)

Retrieve one simulation.

Retrieve one simulation.

### Example
```python
from __future__ import print_function
import time
import swagger_client
from swagger_client.rest import ApiException
from pprint import pprint

# create an instance of the API class
api_instance = swagger_client.DefaultApi()
name = 'name_example' # str | Simulation name

try:
    # Retrieve one simulation.
    api_response = api_instance.get_simulation(name)
    pprint(api_response)
except ApiException as e:
    print("Exception when calling DefaultApi->get_simulation: %s\n" % e)
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **name** | **str**| Simulation name | 

### Return type

[**Simulation**](Simulation.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **get_simulation_status**
> SimulationStatus get_simulation_status(id, clear_progress_events=clear_progress_events)

Get simulation status.

Get simulation status

### Example
```python
from __future__ import print_function
import time
import swagger_client
from swagger_client.rest import ApiException
from pprint import pprint

# create an instance of the API class
api_instance = swagger_client.DefaultApi()
id = 56 # int | Simulation ID
clear_progress_events = true # bool | Clear progress events, by default true. (optional) (default to true)

try:
    # Get simulation status.
    api_response = api_instance.get_simulation_status(id, clear_progress_events=clear_progress_events)
    pprint(api_response)
except ApiException as e:
    print("Exception when calling DefaultApi->get_simulation_status: %s\n" % e)
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **int**| Simulation ID | 
 **clear_progress_events** | **bool**| Clear progress events, by default true. | [optional] [default to true]

### Return type

[**SimulationStatus**](SimulationStatus.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **get_store**
> object get_store()

Get the contents of the data store.

Get the contents of the data store.

### Example
```python
from __future__ import print_function
import time
import swagger_client
from swagger_client.rest import ApiException
from pprint import pprint

# create an instance of the API class
api_instance = swagger_client.DefaultApi()

try:
    # Get the contents of the data store.
    api_response = api_instance.get_store()
    pprint(api_response)
except ApiException as e:
    print("Exception when calling DefaultApi->get_store: %s\n" % e)
```

### Parameters
This endpoint does not need any parameter.

### Return type

**object**

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **get_system**
> System get_system(uuid)

Retrieve one system.

Retrieve one system.

### Example
```python
from __future__ import print_function
import time
import swagger_client
from swagger_client.rest import ApiException
from pprint import pprint

# create an instance of the API class
api_instance = swagger_client.DefaultApi()
uuid = 'uuid_example' # str | System UUID

try:
    # Retrieve one system.
    api_response = api_instance.get_system(uuid)
    pprint(api_response)
except ApiException as e:
    print("Exception when calling DefaultApi->get_system: %s\n" % e)
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **uuid** | **str**| System UUID | 

### Return type

[**System**](System.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **list_aux_variable_names**
> ListNamesResponse list_aux_variable_names(id, problem_name)

Retrieve the aux_variable names in a decision problem.

aux_variable names in a decision problem a simulation.

### Example
```python
from __future__ import print_function
import time
import swagger_client
from swagger_client.rest import ApiException
from pprint import pprint

# create an instance of the API class
api_instance = swagger_client.DefaultApi()
id = 56 # int | Simulation ID
problem_name = 'problem_name_example' # str | Decision problem name

try:
    # Retrieve the aux_variable names in a decision problem.
    api_response = api_instance.list_aux_variable_names(id, problem_name)
    pprint(api_response)
except ApiException as e:
    print("Exception when calling DefaultApi->list_aux_variable_names: %s\n" % e)
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **int**| Simulation ID | 
 **problem_name** | **str**| Decision problem name | 

### Return type

[**ListNamesResponse**](ListNamesResponse.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **list_cached_simulation_results**
> object list_cached_simulation_results()

Return the simulations with cached results.

Return the simulations with cached results.

### Example
```python
from __future__ import print_function
import time
import swagger_client
from swagger_client.rest import ApiException
from pprint import pprint

# create an instance of the API class
api_instance = swagger_client.DefaultApi()

try:
    # Return the simulations with cached results.
    api_response = api_instance.list_cached_simulation_results()
    pprint(api_response)
except ApiException as e:
    print("Exception when calling DefaultApi->list_cached_simulation_results: %s\n" % e)
```

### Parameters
This endpoint does not need any parameter.

### Return type

**object**

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **list_decision_problems**
> ListNamesResponse list_decision_problems(id)

Retrieve the decision problem names in a simulation.

Retrieve the decision problem names in a simulation.

### Example
```python
from __future__ import print_function
import time
import swagger_client
from swagger_client.rest import ApiException
from pprint import pprint

# create an instance of the API class
api_instance = swagger_client.DefaultApi()
id = 56 # int | Simulation ID

try:
    # Retrieve the decision problem names in a simulation.
    api_response = api_instance.list_decision_problems(id)
    pprint(api_response)
except ApiException as e:
    print("Exception when calling DefaultApi->list_decision_problems: %s\n" % e)
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **int**| Simulation ID | 

### Return type

[**ListNamesResponse**](ListNamesResponse.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **list_dual_names**
> ListNamesResponse list_dual_names(id, problem_name)

Retrieve the dual names in a decision problem.

dual names in a decision problem a simulation.

### Example
```python
from __future__ import print_function
import time
import swagger_client
from swagger_client.rest import ApiException
from pprint import pprint

# create an instance of the API class
api_instance = swagger_client.DefaultApi()
id = 56 # int | Simulation ID
problem_name = 'problem_name_example' # str | Decision problem name

try:
    # Retrieve the dual names in a decision problem.
    api_response = api_instance.list_dual_names(id, problem_name)
    pprint(api_response)
except ApiException as e:
    print("Exception when calling DefaultApi->list_dual_names: %s\n" % e)
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **int**| Simulation ID | 
 **problem_name** | **str**| Decision problem name | 

### Return type

[**ListNamesResponse**](ListNamesResponse.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **list_expression_names**
> ListNamesResponse list_expression_names(id, problem_name)

Retrieve the expression names in a decision problem.

expression names in a decision problem a simulation.

### Example
```python
from __future__ import print_function
import time
import swagger_client
from swagger_client.rest import ApiException
from pprint import pprint

# create an instance of the API class
api_instance = swagger_client.DefaultApi()
id = 56 # int | Simulation ID
problem_name = 'problem_name_example' # str | Decision problem name

try:
    # Retrieve the expression names in a decision problem.
    api_response = api_instance.list_expression_names(id, problem_name)
    pprint(api_response)
except ApiException as e:
    print("Exception when calling DefaultApi->list_expression_names: %s\n" % e)
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **int**| Simulation ID | 
 **problem_name** | **str**| Decision problem name | 

### Return type

[**ListNamesResponse**](ListNamesResponse.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **list_parameter_names**
> ListNamesResponse list_parameter_names(id, problem_name)

Retrieve the parameter names in a decision problem.

parameter names in a decision problem a simulation.

### Example
```python
from __future__ import print_function
import time
import swagger_client
from swagger_client.rest import ApiException
from pprint import pprint

# create an instance of the API class
api_instance = swagger_client.DefaultApi()
id = 56 # int | Simulation ID
problem_name = 'problem_name_example' # str | Decision problem name

try:
    # Retrieve the parameter names in a decision problem.
    api_response = api_instance.list_parameter_names(id, problem_name)
    pprint(api_response)
except ApiException as e:
    print("Exception when calling DefaultApi->list_parameter_names: %s\n" % e)
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **int**| Simulation ID | 
 **problem_name** | **str**| Decision problem name | 

### Return type

[**ListNamesResponse**](ListNamesResponse.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **list_simulation_statuses**
> SimulationStatuses list_simulation_statuses(status=status, clear_progress_events=clear_progress_events)

Check status for all simulations.

Check status for all simulations.

### Example
```python
from __future__ import print_function
import time
import swagger_client
from swagger_client.rest import ApiException
from pprint import pprint

# create an instance of the API class
api_instance = swagger_client.DefaultApi()
status = 'status_example' # str | Filter results by simulations with this status. (optional)
clear_progress_events = true # bool | Clear progress events, by default true. (optional) (default to true)

try:
    # Check status for all simulations.
    api_response = api_instance.list_simulation_statuses(status=status, clear_progress_events=clear_progress_events)
    pprint(api_response)
except ApiException as e:
    print("Exception when calling DefaultApi->list_simulation_statuses: %s\n" % e)
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **status** | **str**| Filter results by simulations with this status. | [optional] 
 **clear_progress_events** | **bool**| Clear progress events, by default true. | [optional] [default to true]

### Return type

[**SimulationStatuses**](SimulationStatuses.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **list_simulations**
> ListSimulationsResponse list_simulations()

Retrieve all simulations.

Retrieve all simulations.

### Example
```python
from __future__ import print_function
import time
import swagger_client
from swagger_client.rest import ApiException
from pprint import pprint

# create an instance of the API class
api_instance = swagger_client.DefaultApi()

try:
    # Retrieve all simulations.
    api_response = api_instance.list_simulations()
    pprint(api_response)
except ApiException as e:
    print("Exception when calling DefaultApi->list_simulations: %s\n" % e)
```

### Parameters
This endpoint does not need any parameter.

### Return type

[**ListSimulationsResponse**](ListSimulationsResponse.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **list_systems**
> ListSystemsResponse list_systems()

Retrieve all systems.

Retrieve all systems.

### Example
```python
from __future__ import print_function
import time
import swagger_client
from swagger_client.rest import ApiException
from pprint import pprint

# create an instance of the API class
api_instance = swagger_client.DefaultApi()

try:
    # Retrieve all systems.
    api_response = api_instance.list_systems()
    pprint(api_response)
except ApiException as e:
    print("Exception when calling DefaultApi->list_systems: %s\n" % e)
```

### Parameters
This endpoint does not need any parameter.

### Return type

[**ListSystemsResponse**](ListSystemsResponse.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **list_variable_names**
> ListNamesResponse list_variable_names(id, problem_name)

Retrieve the variable names in a decision problem.

variable names in a decision problem a simulation.

### Example
```python
from __future__ import print_function
import time
import swagger_client
from swagger_client.rest import ApiException
from pprint import pprint

# create an instance of the API class
api_instance = swagger_client.DefaultApi()
id = 56 # int | Simulation ID
problem_name = 'problem_name_example' # str | Decision problem name

try:
    # Retrieve the variable names in a decision problem.
    api_response = api_instance.list_variable_names(id, problem_name)
    pprint(api_response)
except ApiException as e:
    print("Exception when calling DefaultApi->list_variable_names: %s\n" % e)
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **int**| Simulation ID | 
 **problem_name** | **str**| Decision problem name | 

### Return type

[**ListNamesResponse**](ListNamesResponse.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **load_store**
> object load_store(body)

Load saved data.

Load saved data.

### Example
```python
from __future__ import print_function
import time
import swagger_client
from swagger_client.rest import ApiException
from pprint import pprint

# create an instance of the API class
api_instance = swagger_client.DefaultApi()
body = swagger_client.Store() # Store | Saved data

try:
    # Load saved data.
    api_response = api_instance.load_store(body)
    pprint(api_response)
except ApiException as e:
    print("Exception when calling DefaultApi->load_store: %s\n" % e)
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **body** | [**Store**](Store.md)| Saved data | 

### Return type

**object**

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **post_simulation**
> Simulation post_simulation(body)

Store a power simulation.

Store a power simulation.

### Example
```python
from __future__ import print_function
import time
import swagger_client
from swagger_client.rest import ApiException
from pprint import pprint

# create an instance of the API class
api_instance = swagger_client.DefaultApi()
body = swagger_client.Simulation() # Simulation | Power simulation

try:
    # Store a power simulation.
    api_response = api_instance.post_simulation(body)
    pprint(api_response)
except ApiException as e:
    print("Exception when calling DefaultApi->post_simulation: %s\n" % e)
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **body** | [**Simulation**](Simulation.md)| Power simulation | 

### Return type

[**Simulation**](Simulation.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **post_system**
> System post_system(body)

Load a power system from a file path.

Load a power system from a file path.

### Example
```python
from __future__ import print_function
import time
import swagger_client
from swagger_client.rest import ApiException
from pprint import pprint

# create an instance of the API class
api_instance = swagger_client.DefaultApi()
body = swagger_client.PostSystemBody() # PostSystemBody | Post system body

try:
    # Load a power system from a file path.
    api_response = api_instance.post_system(body)
    pprint(api_response)
except ApiException as e:
    print("Exception when calling DefaultApi->post_system: %s\n" % e)
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **body** | [**PostSystemBody**](PostSystemBody.md)| Post system body | 

### Return type

[**System**](System.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **post_system_case**
> System post_system_case(category, name, force_build=force_build)

Load a power system with PowerSystemCaseBuilder.

Load a power system with PowerSystemCaseBuilder.

### Example
```python
from __future__ import print_function
import time
import swagger_client
from swagger_client.rest import ApiException
from pprint import pprint

# create an instance of the API class
api_instance = swagger_client.DefaultApi()
category = 'category_example' # str | System category
name = 'name_example' # str | System name
force_build = true # bool | Force build of system instead of de-serializataion. (optional)

try:
    # Load a power system with PowerSystemCaseBuilder.
    api_response = api_instance.post_system_case(category, name, force_build=force_build)
    pprint(api_response)
except ApiException as e:
    print("Exception when calling DefaultApi->post_system_case: %s\n" % e)
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **category** | **str**| System category | 
 **name** | **str**| System name | 
 **force_build** | **bool**| Force build of system instead of de-serializataion. | [optional] 

### Return type

[**System**](System.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **read_optimizer_stats**
> object read_optimizer_stats(id, problem_name)

Retrieve the optimizer stats for a problem.

Retrieve the optimizer stats for a problem.

### Example
```python
from __future__ import print_function
import time
import swagger_client
from swagger_client.rest import ApiException
from pprint import pprint

# create an instance of the API class
api_instance = swagger_client.DefaultApi()
id = 56 # int | Simulation ID
problem_name = 'problem_name_example' # str | Problem name

try:
    # Retrieve the optimizer stats for a problem.
    api_response = api_instance.read_optimizer_stats(id, problem_name)
    pprint(api_response)
except ApiException as e:
    print("Exception when calling DefaultApi->read_optimizer_stats: %s\n" % e)
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **int**| Simulation ID | 
 **problem_name** | **str**| Problem name | 

### Return type

**object**

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **read_realized_aux_variable_results**
> object read_realized_aux_variable_results(id, problem_name, aux_variable_name)

Retrieve the realized results for a aux_variable.

aux_variable names in a decision problem a simulation.

### Example
```python
from __future__ import print_function
import time
import swagger_client
from swagger_client.rest import ApiException
from pprint import pprint

# create an instance of the API class
api_instance = swagger_client.DefaultApi()
id = 56 # int | Simulation ID
problem_name = 'problem_name_example' # str | Problem name
aux_variable_name = 'aux_variable_name_example' # str | aux_variable name

try:
    # Retrieve the realized results for a aux_variable.
    api_response = api_instance.read_realized_aux_variable_results(id, problem_name, aux_variable_name)
    pprint(api_response)
except ApiException as e:
    print("Exception when calling DefaultApi->read_realized_aux_variable_results: %s\n" % e)
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **int**| Simulation ID | 
 **problem_name** | **str**| Problem name | 
 **aux_variable_name** | **str**| aux_variable name | 

### Return type

**object**

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **read_realized_dual_results**
> object read_realized_dual_results(id, problem_name, dual_name)

Retrieve the realized results for a dual.

dual names in a decision problem a simulation.

### Example
```python
from __future__ import print_function
import time
import swagger_client
from swagger_client.rest import ApiException
from pprint import pprint

# create an instance of the API class
api_instance = swagger_client.DefaultApi()
id = 56 # int | Simulation ID
problem_name = 'problem_name_example' # str | Problem name
dual_name = 'dual_name_example' # str | dual name

try:
    # Retrieve the realized results for a dual.
    api_response = api_instance.read_realized_dual_results(id, problem_name, dual_name)
    pprint(api_response)
except ApiException as e:
    print("Exception when calling DefaultApi->read_realized_dual_results: %s\n" % e)
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **int**| Simulation ID | 
 **problem_name** | **str**| Problem name | 
 **dual_name** | **str**| dual name | 

### Return type

**object**

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **read_realized_expression_results**
> object read_realized_expression_results(id, problem_name, expression_name)

Retrieve the realized results for a expression.

expression names in a decision problem a simulation.

### Example
```python
from __future__ import print_function
import time
import swagger_client
from swagger_client.rest import ApiException
from pprint import pprint

# create an instance of the API class
api_instance = swagger_client.DefaultApi()
id = 56 # int | Simulation ID
problem_name = 'problem_name_example' # str | Problem name
expression_name = 'expression_name_example' # str | expression name

try:
    # Retrieve the realized results for a expression.
    api_response = api_instance.read_realized_expression_results(id, problem_name, expression_name)
    pprint(api_response)
except ApiException as e:
    print("Exception when calling DefaultApi->read_realized_expression_results: %s\n" % e)
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **int**| Simulation ID | 
 **problem_name** | **str**| Problem name | 
 **expression_name** | **str**| expression name | 

### Return type

**object**

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **read_realized_parameter_results**
> object read_realized_parameter_results(id, problem_name, parameter_name)

Retrieve the realized results for a parameter.

parameter names in a decision problem a simulation.

### Example
```python
from __future__ import print_function
import time
import swagger_client
from swagger_client.rest import ApiException
from pprint import pprint

# create an instance of the API class
api_instance = swagger_client.DefaultApi()
id = 56 # int | Simulation ID
problem_name = 'problem_name_example' # str | Problem name
parameter_name = 'parameter_name_example' # str | parameter name

try:
    # Retrieve the realized results for a parameter.
    api_response = api_instance.read_realized_parameter_results(id, problem_name, parameter_name)
    pprint(api_response)
except ApiException as e:
    print("Exception when calling DefaultApi->read_realized_parameter_results: %s\n" % e)
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **int**| Simulation ID | 
 **problem_name** | **str**| Problem name | 
 **parameter_name** | **str**| parameter name | 

### Return type

**object**

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **read_realized_variable_results**
> object read_realized_variable_results(id, problem_name, variable_name)

Retrieve the realized results for a variable.

variable names in a decision problem a simulation.

### Example
```python
from __future__ import print_function
import time
import swagger_client
from swagger_client.rest import ApiException
from pprint import pprint

# create an instance of the API class
api_instance = swagger_client.DefaultApi()
id = 56 # int | Simulation ID
problem_name = 'problem_name_example' # str | Problem name
variable_name = 'variable_name_example' # str | Variable name

try:
    # Retrieve the realized results for a variable.
    api_response = api_instance.read_realized_variable_results(id, problem_name, variable_name)
    pprint(api_response)
except ApiException as e:
    print("Exception when calling DefaultApi->read_realized_variable_results: %s\n" % e)
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **int**| Simulation ID | 
 **problem_name** | **str**| Problem name | 
 **variable_name** | **str**| Variable name | 

### Return type

**object**

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **start_simulation**
> StartSimulationResponse start_simulation(body, output_dir=output_dir, poll_interval=poll_interval)

Start a power simulation.

Start a power simulation.

### Example
```python
from __future__ import print_function
import time
import swagger_client
from swagger_client.rest import ApiException
from pprint import pprint

# create an instance of the API class
api_instance = swagger_client.DefaultApi()
body = swagger_client.Simulation() # Simulation | Power simulation
output_dir = 'output_dir_example' # str | Simulation output directory (optional)
poll_interval = 5 # int | Poll interval on which to check for status. (optional) (default to 5)

try:
    # Start a power simulation.
    api_response = api_instance.start_simulation(body, output_dir=output_dir, poll_interval=poll_interval)
    pprint(api_response)
except ApiException as e:
    print("Exception when calling DefaultApi->start_simulation: %s\n" % e)
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **body** | [**Simulation**](Simulation.md)| Power simulation | 
 **output_dir** | **str**| Simulation output directory | [optional] 
 **poll_interval** | **int**| Poll interval on which to check for status. | [optional] [default to 5]

### Return type

[**StartSimulationResponse**](StartSimulationResponse.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **start_stored_simulation**
> StartSimulationResponse start_stored_simulation(id, output_dir=output_dir, poll_interval=poll_interval)

Start a simulation that was previously stored.

Start a simulation that was previously stored.

### Example
```python
from __future__ import print_function
import time
import swagger_client
from swagger_client.rest import ApiException
from pprint import pprint

# create an instance of the API class
api_instance = swagger_client.DefaultApi()
id = 'id_example' # str | Simulation name
output_dir = 'simulation_output' # str | Simulation output directory (optional) (default to simulation_output)
poll_interval = 5 # int | Poll interval on which to check for status. (optional) (default to 5)

try:
    # Start a simulation that was previously stored.
    api_response = api_instance.start_stored_simulation(id, output_dir=output_dir, poll_interval=poll_interval)
    pprint(api_response)
except ApiException as e:
    print("Exception when calling DefaultApi->start_stored_simulation: %s\n" % e)
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **str**| Simulation name | 
 **output_dir** | **str**| Simulation output directory | [optional] [default to simulation_output]
 **poll_interval** | **int**| Poll interval on which to check for status. | [optional] [default to 5]

### Return type

[**StartSimulationResponse**](StartSimulationResponse.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

