# DecisionModel

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**decision_problem_type** | **str** |  | [optional] [default to 'GenericOpProblem']
**name** | **str** |  | 
**template** | [**ProblemTemplate**](ProblemTemplate.md) |  | 
**system** | **OneOfDecisionModelSystem** |  | 
**optimizer** | [**AbstractOptimizer**](AbstractOptimizer.md) |  | [optional] 
**attributes** | [**list[Attribute]**](Attribute.md) |  | [optional] 
**horizon** | **int** |  | [optional] 
**warm_start** | **bool** |  | [optional] 
**system_to_file** | **bool** |  | [optional] 
**initialize_model** | **bool** |  | [optional] 
**initialization_file** | **str** |  | [optional] 
**deserialize_initial_conditions** | **bool** |  | [optional] 
**export_pwl_vars** | **bool** |  | [optional] 
**allow_fails** | **bool** |  | [optional] 
**optimizer_solve_log_print** | **bool** |  | [optional] 
**detailed_optimizer_stats** | **bool** |  | [optional] 
**calculate_conflict** | **bool** |  | [optional] 
**direct_mode_optimizer** | **bool** |  | [optional] 
**check_numerical_bounds** | **bool** |  | [optional] 
**initial_time** | **str** |  | [optional] 
**time_series_cache_size** | **int** |  | [optional] 

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)

