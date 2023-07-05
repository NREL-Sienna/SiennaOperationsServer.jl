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

class XpressOptimizer(object):
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
        'miprelstop': 'float'
    }

    attribute_map = {
        'optimizer_type': 'optimizer_type',
        'miprelstop': 'MIPRELSTOP'
    }

    def __init__(self, optimizer_type=None, miprelstop=0.0000010):  # noqa: E501
        """XpressOptimizer - a model defined in Swagger"""  # noqa: E501
        self._optimizer_type = None
        self._miprelstop = None
        self.discriminator = None
        self.optimizer_type = optimizer_type
        if miprelstop is not None:
            self.miprelstop = miprelstop

    @property
    def optimizer_type(self):
        """Gets the optimizer_type of this XpressOptimizer.  # noqa: E501


        :return: The optimizer_type of this XpressOptimizer.  # noqa: E501
        :rtype: str
        """
        return self._optimizer_type

    @optimizer_type.setter
    def optimizer_type(self, optimizer_type):
        """Sets the optimizer_type of this XpressOptimizer.


        :param optimizer_type: The optimizer_type of this XpressOptimizer.  # noqa: E501
        :type: str
        """
        if optimizer_type is None:
            raise ValueError("Invalid value for `optimizer_type`, must not be `None`")  # noqa: E501

        self._optimizer_type = optimizer_type

    @property
    def miprelstop(self):
        """Gets the miprelstop of this XpressOptimizer.  # noqa: E501


        :return: The miprelstop of this XpressOptimizer.  # noqa: E501
        :rtype: float
        """
        return self._miprelstop

    @miprelstop.setter
    def miprelstop(self, miprelstop):
        """Sets the miprelstop of this XpressOptimizer.


        :param miprelstop: The miprelstop of this XpressOptimizer.  # noqa: E501
        :type: float
        """

        self._miprelstop = miprelstop

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
        if issubclass(XpressOptimizer, dict):
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
        if not isinstance(other, XpressOptimizer):
            return False

        return self.__dict__ == other.__dict__

    def __ne__(self, other):
        """Returns true if both objects are not equal"""
        return not self == other