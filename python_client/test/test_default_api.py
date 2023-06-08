# coding: utf-8

"""
    SiennaOperationsSimulations

    This is a SiennaOperationsSimulations server.  # noqa: E501

    OpenAPI spec version: 1.0
    
    Generated by: https://github.com/swagger-api/swagger-codegen.git
"""

from __future__ import absolute_import

import unittest

import swagger_client
from swagger_client.api.default_api import DefaultApi  # noqa: E501
from swagger_client.rest import ApiException


class TestDefaultApi(unittest.TestCase):
    """DefaultApi unit test stubs"""

    def setUp(self):
        self.api = DefaultApi()  # noqa: E501

    def tearDown(self):
        pass

    def test_cache_simulation_results(self):
        """Test case for cache_simulation_results

        Cache the results for a simulation.  # noqa: E501
        """
        pass

    def test_cancel_simulation(self):
        """Test case for cancel_simulation

        Cancel a simulation.  # noqa: E501
        """
        pass

    def test_delete_simulation(self):
        """Test case for delete_simulation

        Remove a stored simulation.  # noqa: E501
        """
        pass

    def test_delete_simulations(self):
        """Test case for delete_simulations

        Delete all simulations.  # noqa: E501
        """
        pass

    def test_delete_store(self):
        """Test case for delete_store

        Delete the contents of the data store.  # noqa: E501
        """
        pass

    def test_delete_system(self):
        """Test case for delete_system

        Remove a loaded power system.  # noqa: E501
        """
        pass

    def test_delete_systems(self):
        """Test case for delete_systems

        Delete all systems.  # noqa: E501
        """
        pass

    def test_discard_simulation_results(self):
        """Test case for discard_simulation_results

        Discard the cached results for a simulation.  # noqa: E501
        """
        pass

    def test_get_simulation(self):
        """Test case for get_simulation

        Retrieve one simulation.  # noqa: E501
        """
        pass

    def test_get_simulation_status(self):
        """Test case for get_simulation_status

        Get simulation status.  # noqa: E501
        """
        pass

    def test_get_store(self):
        """Test case for get_store

        Get the contents of the data store.  # noqa: E501
        """
        pass

    def test_get_system(self):
        """Test case for get_system

        Retrieve one system.  # noqa: E501
        """
        pass

    def test_list_aux_variable_names(self):
        """Test case for list_aux_variable_names

        Retrieve the aux_variable names in a decision problem.  # noqa: E501
        """
        pass

    def test_list_cached_simulation_results(self):
        """Test case for list_cached_simulation_results

        Return the simulations with cached results.  # noqa: E501
        """
        pass

    def test_list_decision_problems(self):
        """Test case for list_decision_problems

        Retrieve the decision problem names in a simulation.  # noqa: E501
        """
        pass

    def test_list_dual_names(self):
        """Test case for list_dual_names

        Retrieve the dual names in a decision problem.  # noqa: E501
        """
        pass

    def test_list_expression_names(self):
        """Test case for list_expression_names

        Retrieve the expression names in a decision problem.  # noqa: E501
        """
        pass

    def test_list_parameter_names(self):
        """Test case for list_parameter_names

        Retrieve the parameter names in a decision problem.  # noqa: E501
        """
        pass

    def test_list_simulation_statuses(self):
        """Test case for list_simulation_statuses

        Check status for all simulations.  # noqa: E501
        """
        pass

    def test_list_simulations(self):
        """Test case for list_simulations

        Retrieve all simulations.  # noqa: E501
        """
        pass

    def test_list_systems(self):
        """Test case for list_systems

        Retrieve all systems.  # noqa: E501
        """
        pass

    def test_list_variable_names(self):
        """Test case for list_variable_names

        Retrieve the variable names in a decision problem.  # noqa: E501
        """
        pass

    def test_load_store(self):
        """Test case for load_store

        Load saved data.  # noqa: E501
        """
        pass

    def test_post_simulation(self):
        """Test case for post_simulation

        Store a power simulation.  # noqa: E501
        """
        pass

    def test_post_system(self):
        """Test case for post_system

        Load a power system from a file path.  # noqa: E501
        """
        pass

    def test_post_system_case(self):
        """Test case for post_system_case

        Load a power system with PowerSystemCaseBuilder.  # noqa: E501
        """
        pass

    def test_read_realized_aux_variable_results(self):
        """Test case for read_realized_aux_variable_results

        Retrieve the realized results for a aux_variable.  # noqa: E501
        """
        pass

    def test_read_realized_dual_results(self):
        """Test case for read_realized_dual_results

        Retrieve the realized results for a dual.  # noqa: E501
        """
        pass

    def test_read_realized_expression_results(self):
        """Test case for read_realized_expression_results

        Retrieve the realized results for a expression.  # noqa: E501
        """
        pass

    def test_read_realized_parameter_results(self):
        """Test case for read_realized_parameter_results

        Retrieve the realized results for a parameter.  # noqa: E501
        """
        pass

    def test_read_realized_variable_results(self):
        """Test case for read_realized_variable_results

        Retrieve the realized results for a variable.  # noqa: E501
        """
        pass

    def test_start_simulation(self):
        """Test case for start_simulation

        Start a power simulation.  # noqa: E501
        """
        pass

    def test_start_stored_simulation(self):
        """Test case for start_stored_simulation

        Start a simulation that was previously stored.  # noqa: E501
        """
        pass


if __name__ == '__main__':
    unittest.main()