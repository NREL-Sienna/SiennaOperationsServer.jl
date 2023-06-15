# DefaultApi

All URIs are relative to *http://localhost*

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
> cache_simulation_results(req::HTTP.Request, id::Int64;) -> Any

Cache the results for a simulation.

Cache the results for a simulation.

### Required Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **req** | **HTTP.Request** | The HTTP Request object | 
**id** | **Int64**| Simulation ID | [default to nothing]

### Return type

**Any**

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **cancel_simulation**
> cancel_simulation(req::HTTP.Request, id::Int64;) -> Any

Cancel a simulation.

Cancel a simulation

### Required Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **req** | **HTTP.Request** | The HTTP Request object | 
**id** | [**Int64**](.md)| Simulation name | [default to nothing]

### Return type

**Any**

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **delete_simulation**
> delete_simulation(req::HTTP.Request, name::String;) -> Any

Remove a stored simulation.

Remove a stored simulation.

### Required Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **req** | **HTTP.Request** | The HTTP Request object | 
**name** | **String**| Simulation name | [default to nothing]

### Return type

**Any**

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **delete_simulations**
> delete_simulations(req::HTTP.Request;) -> Any

Delete all simulations.

Delete all simulations.

### Required Parameters
This endpoint does not need any parameter.

### Return type

**Any**

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **delete_store**
> delete_store(req::HTTP.Request;) -> Any

Delete the contents of the data store.

Delete the contents of the data store.

### Required Parameters
This endpoint does not need any parameter.

### Return type

**Any**

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **delete_system**
> delete_system(req::HTTP.Request, uuid::String;) -> Any

Remove a loaded power system.

Remove a loaded power system.

### Required Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **req** | **HTTP.Request** | The HTTP Request object | 
**uuid** | **String**| System UUID | [default to nothing]

### Return type

**Any**

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **delete_systems**
> delete_systems(req::HTTP.Request;) -> Any

Delete all systems.

Delete all systems.

### Required Parameters
This endpoint does not need any parameter.

### Return type

**Any**

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **discard_simulation_results**
> discard_simulation_results(req::HTTP.Request, id::Int64;) -> Any

Discard the cached results for a simulation.

Discard the cached results for a simulation.

### Required Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **req** | **HTTP.Request** | The HTTP Request object | 
**id** | **Int64**| Simulation ID | [default to nothing]

### Return type

**Any**

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **get_simulation**
> get_simulation(req::HTTP.Request, name::String;) -> Simulation

Retrieve one simulation.

Retrieve one simulation.

### Required Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **req** | **HTTP.Request** | The HTTP Request object | 
**name** | **String**| Simulation name | [default to nothing]

### Return type

[**Simulation**](Simulation.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **get_simulation_status**
> get_simulation_status(req::HTTP.Request, id::Int64; clear_progress_events=nothing,) -> SimulationStatus

Get simulation status.

Get simulation status

### Required Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **req** | **HTTP.Request** | The HTTP Request object | 
**id** | [**Int64**](.md)| Simulation ID | [default to nothing]

### Optional Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **clear_progress_events** | **Bool**| Clear progress events, by default true. | [default to true]

### Return type

[**SimulationStatus**](SimulationStatus.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **get_store**
> get_store(req::HTTP.Request;) -> Any

Get the contents of the data store.

Get the contents of the data store.

### Required Parameters
This endpoint does not need any parameter.

### Return type

**Any**

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **get_system**
> get_system(req::HTTP.Request, uuid::String;) -> System

Retrieve one system.

Retrieve one system.

### Required Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **req** | **HTTP.Request** | The HTTP Request object | 
**uuid** | **String**| System UUID | [default to nothing]

### Return type

[**System**](System.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **list_aux_variable_names**
> list_aux_variable_names(req::HTTP.Request, id::Int64, problem_name::String;) -> ListNamesResponse

Retrieve the aux_variable names in a decision problem.

aux_variable names in a decision problem a simulation.

### Required Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **req** | **HTTP.Request** | The HTTP Request object | 
**id** | **Int64**| Simulation ID | [default to nothing]
**problem_name** | **String**| Decision problem name | [default to nothing]

### Return type

[**ListNamesResponse**](ListNamesResponse.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **list_cached_simulation_results**
> list_cached_simulation_results(req::HTTP.Request;) -> Any

Return the simulations with cached results.

Return the simulations with cached results.

### Required Parameters
This endpoint does not need any parameter.

### Return type

**Any**

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **list_decision_problems**
> list_decision_problems(req::HTTP.Request, id::Int64;) -> ListNamesResponse

Retrieve the decision problem names in a simulation.

Retrieve the decision problem names in a simulation.

### Required Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **req** | **HTTP.Request** | The HTTP Request object | 
**id** | **Int64**| Simulation ID | [default to nothing]

### Return type

[**ListNamesResponse**](ListNamesResponse.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **list_dual_names**
> list_dual_names(req::HTTP.Request, id::Int64, problem_name::String;) -> ListNamesResponse

Retrieve the dual names in a decision problem.

dual names in a decision problem a simulation.

### Required Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **req** | **HTTP.Request** | The HTTP Request object | 
**id** | **Int64**| Simulation ID | [default to nothing]
**problem_name** | **String**| Decision problem name | [default to nothing]

### Return type

[**ListNamesResponse**](ListNamesResponse.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **list_expression_names**
> list_expression_names(req::HTTP.Request, id::Int64, problem_name::String;) -> ListNamesResponse

Retrieve the expression names in a decision problem.

expression names in a decision problem a simulation.

### Required Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **req** | **HTTP.Request** | The HTTP Request object | 
**id** | **Int64**| Simulation ID | [default to nothing]
**problem_name** | **String**| Decision problem name | [default to nothing]

### Return type

[**ListNamesResponse**](ListNamesResponse.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **list_parameter_names**
> list_parameter_names(req::HTTP.Request, id::Int64, problem_name::String;) -> ListNamesResponse

Retrieve the parameter names in a decision problem.

parameter names in a decision problem a simulation.

### Required Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **req** | **HTTP.Request** | The HTTP Request object | 
**id** | **Int64**| Simulation ID | [default to nothing]
**problem_name** | **String**| Decision problem name | [default to nothing]

### Return type

[**ListNamesResponse**](ListNamesResponse.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **list_simulation_statuses**
> list_simulation_statuses(req::HTTP.Request; status=nothing, clear_progress_events=nothing,) -> SimulationStatuses

Check status for all simulations.

Check status for all simulations.

### Required Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **req** | **HTTP.Request** | The HTTP Request object | 

### Optional Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **status** | **String**| Filter results by simulations with this status. | [default to nothing]
 **clear_progress_events** | **Bool**| Clear progress events, by default true. | [default to true]

### Return type

[**SimulationStatuses**](SimulationStatuses.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **list_simulations**
> list_simulations(req::HTTP.Request;) -> ListSimulationsResponse

Retrieve all simulations.

Retrieve all simulations.

### Required Parameters
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
> list_systems(req::HTTP.Request;) -> ListSystemsResponse

Retrieve all systems.

Retrieve all systems.

### Required Parameters
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
> list_variable_names(req::HTTP.Request, id::Int64, problem_name::String;) -> ListNamesResponse

Retrieve the variable names in a decision problem.

variable names in a decision problem a simulation.

### Required Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **req** | **HTTP.Request** | The HTTP Request object | 
**id** | **Int64**| Simulation ID | [default to nothing]
**problem_name** | **String**| Decision problem name | [default to nothing]

### Return type

[**ListNamesResponse**](ListNamesResponse.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **load_store**
> load_store(req::HTTP.Request, body::Store;) -> Any

Load saved data.

Load saved data.

### Required Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **req** | **HTTP.Request** | The HTTP Request object | 
**body** | [**Store**](Store.md)| Saved data | 

### Return type

**Any**

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **post_simulation**
> post_simulation(req::HTTP.Request, body::Simulation;) -> Simulation

Store a power simulation.

Store a power simulation.

### Required Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **req** | **HTTP.Request** | The HTTP Request object | 
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
> post_system(req::HTTP.Request, body::PostSystemBody;) -> System

Load a power system from a file path.

Load a power system from a file path.

### Required Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **req** | **HTTP.Request** | The HTTP Request object | 
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
> post_system_case(req::HTTP.Request, category::String, name::String; force_build=nothing,) -> System

Load a power system with PowerSystemCaseBuilder.

Load a power system with PowerSystemCaseBuilder.

### Required Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **req** | **HTTP.Request** | The HTTP Request object | 
**category** | **String**| System category | [default to nothing]
**name** | **String**| System name | [default to nothing]

### Optional Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **force_build** | **Bool**| Force build of system instead of de-serializataion. | [default to nothing]

### Return type

[**System**](System.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **read_optimizer_stats**
> read_optimizer_stats(req::HTTP.Request, id::Int64, problem_name::String;) -> Any

Retrieve the optimizer stats for a problem.

Retrieve the optimizer stats for a problem.

### Required Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **req** | **HTTP.Request** | The HTTP Request object | 
**id** | **Int64**| Simulation ID | [default to nothing]
**problem_name** | **String**| Problem name | [default to nothing]

### Return type

**Any**

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **read_realized_aux_variable_results**
> read_realized_aux_variable_results(req::HTTP.Request, id::Int64, problem_name::String, aux_variable_name::String;) -> Any

Retrieve the realized results for a aux_variable.

aux_variable names in a decision problem a simulation.

### Required Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **req** | **HTTP.Request** | The HTTP Request object | 
**id** | **Int64**| Simulation ID | [default to nothing]
**problem_name** | **String**| Problem name | [default to nothing]
**aux_variable_name** | **String**| aux_variable name | [default to nothing]

### Return type

**Any**

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **read_realized_dual_results**
> read_realized_dual_results(req::HTTP.Request, id::Int64, problem_name::String, dual_name::String;) -> Any

Retrieve the realized results for a dual.

dual names in a decision problem a simulation.

### Required Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **req** | **HTTP.Request** | The HTTP Request object | 
**id** | **Int64**| Simulation ID | [default to nothing]
**problem_name** | **String**| Problem name | [default to nothing]
**dual_name** | **String**| dual name | [default to nothing]

### Return type

**Any**

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **read_realized_expression_results**
> read_realized_expression_results(req::HTTP.Request, id::Int64, problem_name::String, expression_name::String;) -> Any

Retrieve the realized results for a expression.

expression names in a decision problem a simulation.

### Required Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **req** | **HTTP.Request** | The HTTP Request object | 
**id** | **Int64**| Simulation ID | [default to nothing]
**problem_name** | **String**| Problem name | [default to nothing]
**expression_name** | **String**| expression name | [default to nothing]

### Return type

**Any**

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **read_realized_parameter_results**
> read_realized_parameter_results(req::HTTP.Request, id::Int64, problem_name::String, parameter_name::String;) -> Any

Retrieve the realized results for a parameter.

parameter names in a decision problem a simulation.

### Required Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **req** | **HTTP.Request** | The HTTP Request object | 
**id** | **Int64**| Simulation ID | [default to nothing]
**problem_name** | **String**| Problem name | [default to nothing]
**parameter_name** | **String**| parameter name | [default to nothing]

### Return type

**Any**

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **read_realized_variable_results**
> read_realized_variable_results(req::HTTP.Request, id::Int64, problem_name::String, variable_name::String;) -> Any

Retrieve the realized results for a variable.

variable names in a decision problem a simulation.

### Required Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **req** | **HTTP.Request** | The HTTP Request object | 
**id** | **Int64**| Simulation ID | [default to nothing]
**problem_name** | **String**| Problem name | [default to nothing]
**variable_name** | **String**| Variable name | [default to nothing]

### Return type

**Any**

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **start_simulation**
> start_simulation(req::HTTP.Request, body::Simulation; output_dir=nothing, poll_interval=nothing,) -> StartSimulationResponse

Start a power simulation.

Start a power simulation.

### Required Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **req** | **HTTP.Request** | The HTTP Request object | 
**body** | [**Simulation**](Simulation.md)| Power simulation | 

### Optional Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **output_dir** | **String**| Simulation output directory | [default to nothing]
 **poll_interval** | **Int64**| Poll interval on which to check for status. | [default to 5]

### Return type

[**StartSimulationResponse**](StartSimulationResponse.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **start_stored_simulation**
> start_stored_simulation(req::HTTP.Request, id::String; output_dir=nothing, poll_interval=nothing,) -> StartSimulationResponse

Start a simulation that was previously stored.

Start a simulation that was previously stored.

### Required Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **req** | **HTTP.Request** | The HTTP Request object | 
**id** | **String**| Simulation name | [default to nothing]

### Optional Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **output_dir** | **String**| Simulation output directory | [default to &quot;simulation_output&quot;]
 **poll_interval** | **Int64**| Poll interval on which to check for status. | [default to 5]

### Return type

[**StartSimulationResponse**](StartSimulationResponse.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

