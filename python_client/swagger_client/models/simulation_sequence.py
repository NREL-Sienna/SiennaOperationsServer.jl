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

class SimulationSequence(object):
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
        'initial_condition_chronology_type': 'str',
        'feedforwards_by_model': 'list[Feedforwards]'
    }

    attribute_map = {
        'initial_condition_chronology_type': 'initial_condition_chronology_type',
        'feedforwards_by_model': 'feedforwards_by_model'
    }

    def __init__(self, initial_condition_chronology_type=None, feedforwards_by_model=None):  # noqa: E501
        """SimulationSequence - a model defined in Swagger"""  # noqa: E501
        self._initial_condition_chronology_type = None
        self._feedforwards_by_model = None
        self.discriminator = None
        self.initial_condition_chronology_type = initial_condition_chronology_type
        self.feedforwards_by_model = feedforwards_by_model

    @property
    def initial_condition_chronology_type(self):
        """Gets the initial_condition_chronology_type of this SimulationSequence.  # noqa: E501


        :return: The initial_condition_chronology_type of this SimulationSequence.  # noqa: E501
        :rtype: str
        """
        return self._initial_condition_chronology_type

    @initial_condition_chronology_type.setter
    def initial_condition_chronology_type(self, initial_condition_chronology_type):
        """Sets the initial_condition_chronology_type of this SimulationSequence.


        :param initial_condition_chronology_type: The initial_condition_chronology_type of this SimulationSequence.  # noqa: E501
        :type: str
        """
        if initial_condition_chronology_type is None:
            raise ValueError("Invalid value for `initial_condition_chronology_type`, must not be `None`")  # noqa: E501

        self._initial_condition_chronology_type = initial_condition_chronology_type

    @property
    def feedforwards_by_model(self):
        """Gets the feedforwards_by_model of this SimulationSequence.  # noqa: E501


        :return: The feedforwards_by_model of this SimulationSequence.  # noqa: E501
        :rtype: list[Feedforwards]
        """
        return self._feedforwards_by_model

    @feedforwards_by_model.setter
    def feedforwards_by_model(self, feedforwards_by_model):
        """Sets the feedforwards_by_model of this SimulationSequence.


        :param feedforwards_by_model: The feedforwards_by_model of this SimulationSequence.  # noqa: E501
        :type: list[Feedforwards]
        """
        if feedforwards_by_model is None:
            raise ValueError("Invalid value for `feedforwards_by_model`, must not be `None`")  # noqa: E501

        self._feedforwards_by_model = feedforwards_by_model

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
        if issubclass(SimulationSequence, dict):
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
        if not isinstance(other, SimulationSequence):
            return False

        return self.__dict__ == other.__dict__

    def __ne__(self, other):
        """Returns true if both objects are not equal"""
        return not self == other
