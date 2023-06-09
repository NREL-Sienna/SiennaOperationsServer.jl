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

class SystemCase(object):
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
        'category': 'str',
        'name': 'str',
        'descriptor_type': 'str'
    }

    attribute_map = {
        'category': 'category',
        'name': 'name',
        'descriptor_type': 'descriptor_type'
    }

    def __init__(self, category=None, name=None, descriptor_type=None):  # noqa: E501
        """SystemCase - a model defined in Swagger"""  # noqa: E501
        self._category = None
        self._name = None
        self._descriptor_type = None
        self.discriminator = None
        self.category = category
        self.name = name
        self.descriptor_type = descriptor_type

    @property
    def category(self):
        """Gets the category of this SystemCase.  # noqa: E501


        :return: The category of this SystemCase.  # noqa: E501
        :rtype: str
        """
        return self._category

    @category.setter
    def category(self, category):
        """Sets the category of this SystemCase.


        :param category: The category of this SystemCase.  # noqa: E501
        :type: str
        """
        if category is None:
            raise ValueError("Invalid value for `category`, must not be `None`")  # noqa: E501

        self._category = category

    @property
    def name(self):
        """Gets the name of this SystemCase.  # noqa: E501


        :return: The name of this SystemCase.  # noqa: E501
        :rtype: str
        """
        return self._name

    @name.setter
    def name(self, name):
        """Sets the name of this SystemCase.


        :param name: The name of this SystemCase.  # noqa: E501
        :type: str
        """
        if name is None:
            raise ValueError("Invalid value for `name`, must not be `None`")  # noqa: E501

        self._name = name

    @property
    def descriptor_type(self):
        """Gets the descriptor_type of this SystemCase.  # noqa: E501


        :return: The descriptor_type of this SystemCase.  # noqa: E501
        :rtype: str
        """
        return self._descriptor_type

    @descriptor_type.setter
    def descriptor_type(self, descriptor_type):
        """Sets the descriptor_type of this SystemCase.


        :param descriptor_type: The descriptor_type of this SystemCase.  # noqa: E501
        :type: str
        """
        if descriptor_type is None:
            raise ValueError("Invalid value for `descriptor_type`, must not be `None`")  # noqa: E501

        self._descriptor_type = descriptor_type

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
        if issubclass(SystemCase, dict):
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
        if not isinstance(other, SystemCase):
            return False

        return self.__dict__ == other.__dict__

    def __ne__(self, other):
        """Returns true if both objects are not equal"""
        return not self == other
