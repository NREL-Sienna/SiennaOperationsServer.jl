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

class FixValueFeedforward(object):
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
        'component_type': 'str',
        'source': 'str',
        'affected_values': 'list[str]',
        'feedforward_type': 'str'
    }

    attribute_map = {
        'component_type': 'component_type',
        'source': 'source',
        'affected_values': 'affected_values',
        'feedforward_type': 'feedforward_type'
    }

    def __init__(self, component_type=None, source=None, affected_values=None, feedforward_type=None):  # noqa: E501
        """FixValueFeedforward - a model defined in Swagger"""  # noqa: E501
        self._component_type = None
        self._source = None
        self._affected_values = None
        self._feedforward_type = None
        self.discriminator = None
        self.component_type = component_type
        self.source = source
        self.affected_values = affected_values
        self.feedforward_type = feedforward_type

    @property
    def component_type(self):
        """Gets the component_type of this FixValueFeedforward.  # noqa: E501


        :return: The component_type of this FixValueFeedforward.  # noqa: E501
        :rtype: str
        """
        return self._component_type

    @component_type.setter
    def component_type(self, component_type):
        """Sets the component_type of this FixValueFeedforward.


        :param component_type: The component_type of this FixValueFeedforward.  # noqa: E501
        :type: str
        """
        if component_type is None:
            raise ValueError("Invalid value for `component_type`, must not be `None`")  # noqa: E501

        self._component_type = component_type

    @property
    def source(self):
        """Gets the source of this FixValueFeedforward.  # noqa: E501


        :return: The source of this FixValueFeedforward.  # noqa: E501
        :rtype: str
        """
        return self._source

    @source.setter
    def source(self, source):
        """Sets the source of this FixValueFeedforward.


        :param source: The source of this FixValueFeedforward.  # noqa: E501
        :type: str
        """
        if source is None:
            raise ValueError("Invalid value for `source`, must not be `None`")  # noqa: E501

        self._source = source

    @property
    def affected_values(self):
        """Gets the affected_values of this FixValueFeedforward.  # noqa: E501


        :return: The affected_values of this FixValueFeedforward.  # noqa: E501
        :rtype: list[str]
        """
        return self._affected_values

    @affected_values.setter
    def affected_values(self, affected_values):
        """Sets the affected_values of this FixValueFeedforward.


        :param affected_values: The affected_values of this FixValueFeedforward.  # noqa: E501
        :type: list[str]
        """
        if affected_values is None:
            raise ValueError("Invalid value for `affected_values`, must not be `None`")  # noqa: E501

        self._affected_values = affected_values

    @property
    def feedforward_type(self):
        """Gets the feedforward_type of this FixValueFeedforward.  # noqa: E501


        :return: The feedforward_type of this FixValueFeedforward.  # noqa: E501
        :rtype: str
        """
        return self._feedforward_type

    @feedforward_type.setter
    def feedforward_type(self, feedforward_type):
        """Sets the feedforward_type of this FixValueFeedforward.


        :param feedforward_type: The feedforward_type of this FixValueFeedforward.  # noqa: E501
        :type: str
        """
        if feedforward_type is None:
            raise ValueError("Invalid value for `feedforward_type`, must not be `None`")  # noqa: E501

        self._feedforward_type = feedforward_type

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
        if issubclass(FixValueFeedforward, dict):
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
        if not isinstance(other, FixValueFeedforward):
            return False

        return self.__dict__ == other.__dict__

    def __ne__(self, other):
        """Returns true if both objects are not equal"""
        return not self == other