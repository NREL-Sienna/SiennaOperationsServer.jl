# DecisionModel


## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**decision_problem_type** | **String** |  | [optional] [default to "GenericOpProblem"]
**name** | **String** |  | [default to nothing]
**template** | [***ProblemTemplate**](ProblemTemplate.md) |  | [default to nothing]
**system** | [***DecisionModelSystem**](DecisionModelSystem.md) |  | [default to nothing]
**optimizer** | [***Optimizer**](Optimizer.md) |  | [optional] [default to nothing]
**attributes** | [**Vector{Attribute}**](Attribute.md) |  | [optional] [default to nothing]
**horizon** | **Int64** |  | [optional] [default to 0]
**warm_start** | **Bool** |  | [optional] [default to true]
**system_to_file** | **Bool** |  | [optional] [default to true]
**initialize_model** | **Bool** |  | [optional] [default to true]
**initialization_file** | **String** |  | [optional] [default to ""]
**deserialize_initial_conditions** | **Bool** |  | [optional] [default to false]
**export_pwl_vars** | **Bool** |  | [optional] [default to false]
**allow_fails** | **Bool** |  | [optional] [default to false]
**optimizer_solve_log_print** | **Bool** |  | [optional] [default to false]
**detailed_optimizer_stats** | **Bool** |  | [optional] [default to false]
**calculate_conflict** | **Bool** |  | [optional] [default to false]
**direct_mode_optimizer** | **Bool** |  | [optional] [default to false]
**check_numerical_bounds** | **Bool** |  | [optional] [default to true]
**initial_time** | **String** |  | [optional] [default to nothing]
**time_series_cache_size** | **Int64** |  | [optional] [default to 1048576]


[[Back to Model list]](../README.md#models) [[Back to API list]](../README.md#api-endpoints) [[Back to README]](../README.md)


