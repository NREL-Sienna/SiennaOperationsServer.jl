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

class HighsOptimizer(object):
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
        'optimizer_type': 'str',
        'time_limit': 'float',
        'log_to_console': 'bool'
    }

    attribute_map = {
        'optimizer_type': 'optimizer_type',
        'time_limit': 'time_limit',
        'log_to_console': 'log_to_console'
    }

    def __init__(self, optimizer_type=None, time_limit=100.0, log_to_console=False):  # noqa: E501
        """HighsOptimizer - a model defined in Swagger"""  # noqa: E501
        self._optimizer_type = None
        self._time_limit = None
        self._log_to_console = None
        self.discriminator = None
        self.optimizer_type = optimizer_type
        if time_limit is not None:
            self.time_limit = time_limit
        if log_to_console is not None:
            self.log_to_console = log_to_console

    @property
    def optimizer_type(self):
        """Gets the optimizer_type of this HighsOptimizer.  # noqa: E501


        :return: The optimizer_type of this HighsOptimizer.  # noqa: E501
        :rtype: str
        """
        return self._optimizer_type

    @optimizer_type.setter
    def optimizer_type(self, optimizer_type):
        """Sets the optimizer_type of this HighsOptimizer.


        :param optimizer_type: The optimizer_type of this HighsOptimizer.  # noqa: E501
        :type: str
        """
        if optimizer_type is None:
            raise ValueError("Invalid value for `optimizer_type`, must not be `None`")  # noqa: E501

        self._optimizer_type = optimizer_type

    @property
    def time_limit(self):
        """Gets the time_limit of this HighsOptimizer.  # noqa: E501


        :return: The time_limit of this HighsOptimizer.  # noqa: E501
        :rtype: float
        """
        return self._time_limit

    @time_limit.setter
    def time_limit(self, time_limit):
        """Sets the time_limit of this HighsOptimizer.


        :param time_limit: The time_limit of this HighsOptimizer.  # noqa: E501
        :type: float
        """

        self._time_limit = time_limit

    @property
    def log_to_console(self):
        """Gets the log_to_console of this HighsOptimizer.  # noqa: E501


        :return: The log_to_console of this HighsOptimizer.  # noqa: E501
        :rtype: bool
        """
        return self._log_to_console

    @log_to_console.setter
    def log_to_console(self, log_to_console):
        """Sets the log_to_console of this HighsOptimizer.


        :param log_to_console: The log_to_console of this HighsOptimizer.  # noqa: E501
        :type: bool
        """

        self._log_to_console = log_to_console

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
        if issubclass(HighsOptimizer, dict):
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
        if not isinstance(other, HighsOptimizer):
            return False

        return self.__dict__ == other.__dict__

    def __ne__(self, other):
        """Returns true if both objects are not equal"""
        return not self == other
