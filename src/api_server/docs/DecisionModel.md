# DecisionModel


## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**decision_problem_type** | **String** |  | [optional] [default to "GenericOpProblem"]
**name** | **String** |  | [default to nothing]
**template** | [***ProblemTemplate**](ProblemTemplate.md) |  | [default to nothing]
**system** | [***DecisionModelSystem**](DecisionModelSystem.md) |  | [default to nothing]
**optimizer** | [***AbstractOptimizer**](AbstractOptimizer.md) |  | [optional] [default to nothing]
**attributes** | [**Vector{Attribute}**](Attribute.md) |  | [optional] [default to nothing]
**horizon** | **Int64** |  | [optional] [default to nothing]
**warm_start** | **Bool** |  | [optional] [default to nothing]
**system_to_file** | **Bool** |  | [optional] [default to nothing]
**initialize_model** | **Bool** |  | [optional] [default to nothing]
**initialization_file** | **String** |  | [optional] [default to nothing]
**deserialize_initial_conditions** | **Bool** |  | [optional] [default to nothing]
**export_pwl_vars** | **Bool** |  | [optional] [default to nothing]
**allow_fails** | **Bool** |  | [optional] [default to nothing]
**optimizer_solve_log_print** | **Bool** |  | [optional] [default to nothing]
**detailed_optimizer_stats** | **Bool** |  | [optional] [default to nothing]
**calculate_conflict** | **Bool** |  | [optional] [default to nothing]
**direct_mode_optimizer** | **Bool** |  | [optional] [default to nothing]
**check_numerical_bounds** | **Bool** |  | [optional] [default to nothing]
**initial_time** | **String** |  | [optional] [default to nothing]
**time_series_cache_size** | **Int64** |  | [optional] [default to nothing]


[[Back to Model list]](../README.md#models) [[Back to API list]](../README.md#api-endpoints) [[Back to README]](../README.md)


