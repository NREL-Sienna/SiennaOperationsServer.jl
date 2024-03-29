# coding: utf-8

"""
    SiennaOperationsSimulations

    This is a SiennaOperationsSimulations server.  # noqa: E501

    OpenAPI spec version: 1.0
    
    Generated by: https://github.com/swagger-api/swagger-codegen.git
"""

import pprint
import re  # noqa: F401

import six

class DecisionModel(object):
    """NOTE: This class is auto generated by the swagger code generator program.

    Do not edit the class manually.
    """
    """
    Attributes:
      swagger_types (dict): The key is attribute name
                            and the value is attribute type.
      attribute_map (dict): The key is attribute name
                            and the value is json key in definition.
    """
    swagger_types = {
        'decision_problem_type': 'str',
        'name': 'str',
        'template': 'ProblemTemplate',
        'system': 'OneOfDecisionModelSystem',
        'optimizer': 'Optimizer',
        'attributes': 'list[Attribute]',
        'horizon': 'int',
        'warm_start': 'bool',
        'system_to_file': 'bool',
        'initialize_model': 'bool',
        'initialization_file': 'str',
        'deserialize_initial_conditions': 'bool',
        'export_pwl_vars': 'bool',
        'allow_fails': 'bool',
        'optimizer_solve_log_print': 'bool',
        'detailed_optimizer_stats': 'bool',
        'calculate_conflict': 'bool',
        'direct_mode_optimizer': 'bool',
        'check_numerical_bounds': 'bool',
        'initial_time': 'str',
        'time_series_cache_size': 'int'
    }

    attribute_map = {
        'decision_problem_type': 'decision_problem_type',
        'name': 'name',
        'template': 'template',
        'system': 'system',
        'optimizer': 'optimizer',
        'attributes': 'attributes',
        'horizon': 'horizon',
        'warm_start': 'warm_start',
        'system_to_file': 'system_to_file',
        'initialize_model': 'initialize_model',
        'initialization_file': 'initialization_file',
        'deserialize_initial_conditions': 'deserialize_initial_conditions',
        'export_pwl_vars': 'export_pwl_vars',
        'allow_fails': 'allow_fails',
        'optimizer_solve_log_print': 'optimizer_solve_log_print',
        'detailed_optimizer_stats': 'detailed_optimizer_stats',
        'calculate_conflict': 'calculate_conflict',
        'direct_mode_optimizer': 'direct_mode_optimizer',
        'check_numerical_bounds': 'check_numerical_bounds',
        'initial_time': 'initial_time',
        'time_series_cache_size': 'time_series_cache_size'
    }

    def __init__(self, decision_problem_type='GenericOpProblem', name=None, template=None, system=None, optimizer=None, attributes=None, horizon=0, warm_start=True, system_to_file=True, initialize_model=True, initialization_file='', deserialize_initial_conditions=False, export_pwl_vars=False, allow_fails=False, optimizer_solve_log_print=False, detailed_optimizer_stats=False, calculate_conflict=False, direct_mode_optimizer=False, check_numerical_bounds=True, initial_time=None, time_series_cache_size=1048576):  # noqa: E501
        """DecisionModel - a model defined in Swagger"""  # noqa: E501
        self._decision_problem_type = None
        self._name = None
        self._template = None
        self._system = None
        self._optimizer = None
        self._attributes = None
        self._horizon = None
        self._warm_start = None
        self._system_to_file = None
        self._initialize_model = None
        self._initialization_file = None
        self._deserialize_initial_conditions = None
        self._export_pwl_vars = None
        self._allow_fails = None
        self._optimizer_solve_log_print = None
        self._detailed_optimizer_stats = None
        self._calculate_conflict = None
        self._direct_mode_optimizer = None
        self._check_numerical_bounds = None
        self._initial_time = None
        self._time_series_cache_size = None
        self.discriminator = None
        if decision_problem_type is not None:
            self.decision_problem_type = decision_problem_type
        self.name = name
        self.template = template
        self.system = system
        if optimizer is not None:
            self.optimizer = optimizer
        if attributes is not None:
            self.attributes = attributes
        if horizon is not None:
            self.horizon = horizon
        if warm_start is not None:
            self.warm_start = warm_start
        if system_to_file is not None:
            self.system_to_file = system_to_file
        if initialize_model is not None:
            self.initialize_model = initialize_model
        if initialization_file is not None:
            self.initialization_file = initialization_file
        if deserialize_initial_conditions is not None:
            self.deserialize_initial_conditions = deserialize_initial_conditions
        if export_pwl_vars is not None:
            self.export_pwl_vars = export_pwl_vars
        if allow_fails is not None:
            self.allow_fails = allow_fails
        if optimizer_solve_log_print is not None:
            self.optimizer_solve_log_print = optimizer_solve_log_print
        if detailed_optimizer_stats is not None:
            self.detailed_optimizer_stats = detailed_optimizer_stats
        if calculate_conflict is not None:
            self.calculate_conflict = calculate_conflict
        if direct_mode_optimizer is not None:
            self.direct_mode_optimizer = direct_mode_optimizer
        if check_numerical_bounds is not None:
            self.check_numerical_bounds = check_numerical_bounds
        if initial_time is not None:
            self.initial_time = initial_time
        if time_series_cache_size is not None:
            self.time_series_cache_size = time_series_cache_size

    @property
    def decision_problem_type(self):
        """Gets the decision_problem_type of this DecisionModel.  # noqa: E501


        :return: The decision_problem_type of this DecisionModel.  # noqa: E501
        :rtype: str
        """
        return self._decision_problem_type

    @decision_problem_type.setter
    def decision_problem_type(self, decision_problem_type):
        """Sets the decision_problem_type of this DecisionModel.


        :param decision_problem_type: The decision_problem_type of this DecisionModel.  # noqa: E501
        :type: str
        """

        self._decision_problem_type = decision_problem_type

    @property
    def name(self):
        """Gets the name of this DecisionModel.  # noqa: E501


        :return: The name of this DecisionModel.  # noqa: E501
        :rtype: str
        """
        return self._name

    @name.setter
    def name(self, name):
        """Sets the name of this DecisionModel.


        :param name: The name of this DecisionModel.  # noqa: E501
        :type: str
        """
        if name is None:
            raise ValueError("Invalid value for `name`, must not be `None`")  # noqa: E501

        self._name = name

    @property
    def template(self):
        """Gets the template of this DecisionModel.  # noqa: E501


        :return: The template of this DecisionModel.  # noqa: E501
        :rtype: ProblemTemplate
        """
        return self._template

    @template.setter
    def template(self, template):
        """Sets the template of this DecisionModel.


        :param template: The template of this DecisionModel.  # noqa: E501
        :type: ProblemTemplate
        """
        if template is None:
            raise ValueError("Invalid value for `template`, must not be `None`")  # noqa: E501

        self._template = template

    @property
    def system(self):
        """Gets the system of this DecisionModel.  # noqa: E501


        :return: The system of this DecisionModel.  # noqa: E501
        :rtype: OneOfDecisionModelSystem
        """
        return self._system

    @system.setter
    def system(self, system):
        """Sets the system of this DecisionModel.


        :param system: The system of this DecisionModel.  # noqa: E501
        :type: OneOfDecisionModelSystem
        """
        if system is None:
            raise ValueError("Invalid value for `system`, must not be `None`")  # noqa: E501

        self._system = system

    @property
    def optimizer(self):
        """Gets the optimizer of this DecisionModel.  # noqa: E501


        :return: The optimizer of this DecisionModel.  # noqa: E501
        :rtype: Optimizer
        """
        return self._optimizer

    @optimizer.setter
    def optimizer(self, optimizer):
        """Sets the optimizer of this DecisionModel.


        :param optimizer: The optimizer of this DecisionModel.  # noqa: E501
        :type: Optimizer
        """

        self._optimizer = optimizer

    @property
    def attributes(self):
        """Gets the attributes of this DecisionModel.  # noqa: E501


        :return: The attributes of this DecisionModel.  # noqa: E501
        :rtype: list[Attribute]
        """
        return self._attributes

    @attributes.setter
    def attributes(self, attributes):
        """Sets the attributes of this DecisionModel.


        :param attributes: The attributes of this DecisionModel.  # noqa: E501
        :type: list[Attribute]
        """

        self._attributes = attributes

    @property
    def horizon(self):
        """Gets the horizon of this DecisionModel.  # noqa: E501


        :return: The horizon of this DecisionModel.  # noqa: E501
        :rtype: int
        """
        return self._horizon

    @horizon.setter
    def horizon(self, horizon):
        """Sets the horizon of this DecisionModel.


        :param horizon: The horizon of this DecisionModel.  # noqa: E501
        :type: int
        """

        self._horizon = horizon

    @property
    def warm_start(self):
        """Gets the warm_start of this DecisionModel.  # noqa: E501


        :return: The warm_start of this DecisionModel.  # noqa: E501
        :rtype: bool
        """
        return self._warm_start

    @warm_start.setter
    def warm_start(self, warm_start):
        """Sets the warm_start of this DecisionModel.


        :param warm_start: The warm_start of this DecisionModel.  # noqa: E501
        :type: bool
        """

        self._warm_start = warm_start

    @property
    def system_to_file(self):
        """Gets the system_to_file of this DecisionModel.  # noqa: E501


        :return: The system_to_file of this DecisionModel.  # noqa: E501
        :rtype: bool
        """
        return self._system_to_file

    @system_to_file.setter
    def system_to_file(self, system_to_file):
        """Sets the system_to_file of this DecisionModel.


        :param system_to_file: The system_to_file of this DecisionModel.  # noqa: E501
        :type: bool
        """

        self._system_to_file = system_to_file

    @property
    def initialize_model(self):
        """Gets the initialize_model of this DecisionModel.  # noqa: E501


        :return: The initialize_model of this DecisionModel.  # noqa: E501
        :rtype: bool
        """
        return self._initialize_model

    @initialize_model.setter
    def initialize_model(self, initialize_model):
        """Sets the initialize_model of this DecisionModel.


        :param initialize_model: The initialize_model of this DecisionModel.  # noqa: E501
        :type: bool
        """

        self._initialize_model = initialize_model

    @property
    def initialization_file(self):
        """Gets the initialization_file of this DecisionModel.  # noqa: E501


        :return: The initialization_file of this DecisionModel.  # noqa: E501
        :rtype: str
        """
        return self._initialization_file

    @initialization_file.setter
    def initialization_file(self, initialization_file):
        """Sets the initialization_file of this DecisionModel.


        :param initialization_file: The initialization_file of this DecisionModel.  # noqa: E501
        :type: str
        """

        self._initialization_file = initialization_file

    @property
    def deserialize_initial_conditions(self):
        """Gets the deserialize_initial_conditions of this DecisionModel.  # noqa: E501


        :return: The deserialize_initial_conditions of this DecisionModel.  # noqa: E501
        :rtype: bool
        """
        return self._deserialize_initial_conditions

    @deserialize_initial_conditions.setter
    def deserialize_initial_conditions(self, deserialize_initial_conditions):
        """Sets the deserialize_initial_conditions of this DecisionModel.


        :param deserialize_initial_conditions: The deserialize_initial_conditions of this DecisionModel.  # noqa: E501
        :type: bool
        """

        self._deserialize_initial_conditions = deserialize_initial_conditions

    @property
    def export_pwl_vars(self):
        """Gets the export_pwl_vars of this DecisionModel.  # noqa: E501


        :return: The export_pwl_vars of this DecisionModel.  # noqa: E501
        :rtype: bool
        """
        return self._export_pwl_vars

    @export_pwl_vars.setter
    def export_pwl_vars(self, export_pwl_vars):
        """Sets the export_pwl_vars of this DecisionModel.


        :param export_pwl_vars: The export_pwl_vars of this DecisionModel.  # noqa: E501
        :type: bool
        """

        self._export_pwl_vars = export_pwl_vars

    @property
    def allow_fails(self):
        """Gets the allow_fails of this DecisionModel.  # noqa: E501


        :return: The allow_fails of this DecisionModel.  # noqa: E501
        :rtype: bool
        """
        return self._allow_fails

    @allow_fails.setter
    def allow_fails(self, allow_fails):
        """Sets the allow_fails of this DecisionModel.


        :param allow_fails: The allow_fails of this DecisionModel.  # noqa: E501
        :type: bool
        """

        self._allow_fails = allow_fails

    @property
    def optimizer_solve_log_print(self):
        """Gets the optimizer_solve_log_print of this DecisionModel.  # noqa: E501


        :return: The optimizer_solve_log_print of this DecisionModel.  # noqa: E501
        :rtype: bool
        """
        return self._optimizer_solve_log_print

    @optimizer_solve_log_print.setter
    def optimizer_solve_log_print(self, optimizer_solve_log_print):
        """Sets the optimizer_solve_log_print of this DecisionModel.


        :param optimizer_solve_log_print: The optimizer_solve_log_print of this DecisionModel.  # noqa: E501
        :type: bool
        """

        self._optimizer_solve_log_print = optimizer_solve_log_print

    @property
    def detailed_optimizer_stats(self):
        """Gets the detailed_optimizer_stats of this DecisionModel.  # noqa: E501


        :return: The detailed_optimizer_stats of this DecisionModel.  # noqa: E501
        :rtype: bool
        """
        return self._detailed_optimizer_stats

    @detailed_optimizer_stats.setter
    def detailed_optimizer_stats(self, detailed_optimizer_stats):
        """Sets the detailed_optimizer_stats of this DecisionModel.


        :param detailed_optimizer_stats: The detailed_optimizer_stats of this DecisionModel.  # noqa: E501
        :type: bool
        """

        self._detailed_optimizer_stats = detailed_optimizer_stats

    @property
    def calculate_conflict(self):
        """Gets the calculate_conflict of this DecisionModel.  # noqa: E501


        :return: The calculate_conflict of this DecisionModel.  # noqa: E501
        :rtype: bool
        """
        return self._calculate_conflict

    @calculate_conflict.setter
    def calculate_conflict(self, calculate_conflict):
        """Sets the calculate_conflict of this DecisionModel.


        :param calculate_conflict: The calculate_conflict of this DecisionModel.  # noqa: E501
        :type: bool
        """

        self._calculate_conflict = calculate_conflict

    @property
    def direct_mode_optimizer(self):
        """Gets the direct_mode_optimizer of this DecisionModel.  # noqa: E501


        :return: The direct_mode_optimizer of this DecisionModel.  # noqa: E501
        :rtype: bool
        """
        return self._direct_mode_optimizer

    @direct_mode_optimizer.setter
    def direct_mode_optimizer(self, direct_mode_optimizer):
        """Sets the direct_mode_optimizer of this DecisionModel.


        :param direct_mode_optimizer: The direct_mode_optimizer of this DecisionModel.  # noqa: E501
        :type: bool
        """

        self._direct_mode_optimizer = direct_mode_optimizer

    @property
    def check_numerical_bounds(self):
        """Gets the check_numerical_bounds of this DecisionModel.  # noqa: E501


        :return: The check_numerical_bounds of this DecisionModel.  # noqa: E501
        :rtype: bool
        """
        return self._check_numerical_bounds

    @check_numerical_bounds.setter
    def check_numerical_bounds(self, check_numerical_bounds):
        """Sets the check_numerical_bounds of this DecisionModel.


        :param check_numerical_bounds: The check_numerical_bounds of this DecisionModel.  # noqa: E501
        :type: bool
        """

        self._check_numerical_bounds = check_numerical_bounds

    @property
    def initial_time(self):
        """Gets the initial_time of this DecisionModel.  # noqa: E501


        :return: The initial_time of this DecisionModel.  # noqa: E501
        :rtype: str
        """
        return self._initial_time

    @initial_time.setter
    def initial_time(self, initial_time):
        """Sets the initial_time of this DecisionModel.


        :param initial_time: The initial_time of this DecisionModel.  # noqa: E501
        :type: str
        """

        self._initial_time = initial_time

    @property
    def time_series_cache_size(self):
        """Gets the time_series_cache_size of this DecisionModel.  # noqa: E501


        :return: The time_series_cache_size of this DecisionModel.  # noqa: E501
        :rtype: int
        """
        return self._time_series_cache_size

    @time_series_cache_size.setter
    def time_series_cache_size(self, time_series_cache_size):
        """Sets the time_series_cache_size of this DecisionModel.


        :param time_series_cache_size: The time_series_cache_size of this DecisionModel.  # noqa: E501
        :type: int
        """

        self._time_series_cache_size = time_series_cache_size

    def to_dict(self):
        """Returns the model properties as a dict"""
        result = {}

        for attr, _ in six.iteritems(self.swagger_types):
            value = getattr(self, attr)
            if isinstance(value, list):
                result[attr] = list(map(
                    lambda x: x.to_dict() if hasattr(x, "to_dict") else x,
                    value
                ))
            elif hasattr(value, "to_dict"):
                result[attr] = value.to_dict()
            elif isinstance(value, dict):
                result[attr] = dict(map(
                    lambda item: (item[0], item[1].to_dict())
                    if hasattr(item[1], "to_dict") else item,
                    value.items()
                ))
            else:
                result[attr] = value
        if issubclass(DecisionModel, dict):
            for key, value in self.items():
                result[key] = value

        return result

    def to_str(self):
        """Returns the string representation of the model"""
        return pprint.pformat(self.to_dict())

    def __repr__(self):
        """For `print` and `pprint`"""
        return self.to_str()

    def __eq__(self, other):
        """Returns true if both objects are equal"""
        if not isinstance(other, DecisionModel):
            return False

        return self.__dict__ == other.__dict__

    def __ne__(self, other):
        """Returns true if both objects are not equal"""
        return not self == other
