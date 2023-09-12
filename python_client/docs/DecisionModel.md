# DecisionModel

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**decision_problem_type** | **str** |  | [optional] [default to 'GenericOpProblem']
**name** | **str** |  | 
**template** | [**ProblemTemplate**](ProblemTemplate.md) |  | 
**system** | **OneOfDecisionModelSystem** |  | 
**optimizer** | [**Optimizer**](Optimizer.md) |  | [optional] 
**attributes** | [**list[Attribute]**](Attribute.md) |  | [optional] 
**horizon** | **int** |  | [optional] [default to 0]
**warm_start** | **bool** |  | [optional] [default to True]
**system_to_file** | **bool** |  | [optional] [default to True]
**initialize_model** | **bool** |  | [optional] [default to True]
**initialization_file** | **str** |  | [optional] [default to '']
**deserialize_initial_conditions** | **bool** |  | [optional] [default to False]
**export_pwl_vars** | **bool** |  | [optional] [default to False]
**allow_fails** | **bool** |  | [optional] [default to False]
**optimizer_solve_log_print** | **bool** |  | [optional] [default to False]
**detailed_optimizer_stats** | **bool** |  | [optional] [default to False]
**calculate_conflict** | **bool** |  | [optional] [default to False]
**direct_mode_optimizer** | **bool** |  | [optional] [default to False]
**check_numerical_bounds** | **bool** |  | [optional] [default to True]
**initial_time** | **str** |  | [optional] 
**time_series_cache_size** | **int** |  | [optional] [default to 1048576]

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)

