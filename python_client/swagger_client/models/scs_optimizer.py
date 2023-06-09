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

class ScsOptimizer(object):
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
        'max_iters': 'int',
        'eps': 'float',
        'verbose': 'bool'
    }

    attribute_map = {
        'optimizer_type': 'optimizer_type',
        'max_iters': 'max_iters',
        'eps': 'eps',
        'verbose': 'verbose'
    }

    def __init__(self, optimizer_type=None, max_iters=100000, eps=0.00010, verbose=None):  # noqa: E501
        """ScsOptimizer - a model defined in Swagger"""  # noqa: E501
        self._optimizer_type = None
        self._max_iters = None
        self._eps = None
        self._verbose = None
        self.discriminator = None
        self.optimizer_type = optimizer_type
        if max_iters is not None:
            self.max_iters = max_iters
        if eps is not None:
            self.eps = eps
        if verbose is not None:
            self.verbose = verbose

    @property
    def optimizer_type(self):
        """Gets the optimizer_type of this ScsOptimizer.  # noqa: E501


        :return: The optimizer_type of this ScsOptimizer.  # noqa: E501
        :rtype: str
        """
        return self._optimizer_type

    @optimizer_type.setter
    def optimizer_type(self, optimizer_type):
        """Sets the optimizer_type of this ScsOptimizer.


        :param optimizer_type: The optimizer_type of this ScsOptimizer.  # noqa: E501
        :type: str
        """
        if optimizer_type is None:
            raise ValueError("Invalid value for `optimizer_type`, must not be `None`")  # noqa: E501

        self._optimizer_type = optimizer_type

    @property
    def max_iters(self):
        """Gets the max_iters of this ScsOptimizer.  # noqa: E501


        :return: The max_iters of this ScsOptimizer.  # noqa: E501
        :rtype: int
        """
        return self._max_iters

    @max_iters.setter
    def max_iters(self, max_iters):
        """Sets the max_iters of this ScsOptimizer.


        :param max_iters: The max_iters of this ScsOptimizer.  # noqa: E501
        :type: int
        """

        self._max_iters = max_iters

    @property
    def eps(self):
        """Gets the eps of this ScsOptimizer.  # noqa: E501


        :return: The eps of this ScsOptimizer.  # noqa: E501
        :rtype: float
        """
        return self._eps

    @eps.setter
    def eps(self, eps):
        """Sets the eps of this ScsOptimizer.


        :param eps: The eps of this ScsOptimizer.  # noqa: E501
        :type: float
        """

        self._eps = eps

    @property
    def verbose(self):
        """Gets the verbose of this ScsOptimizer.  # noqa: E501


        :return: The verbose of this ScsOptimizer.  # noqa: E501
        :rtype: bool
        """
        return self._verbose

    @verbose.setter
    def verbose(self, verbose):
        """Sets the verbose of this ScsOptimizer.


        :param verbose: The verbose of this ScsOptimizer.  # noqa: E501
        :type: bool
        """

        self._verbose = verbose

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
        if issubclass(ScsOptimizer, dict):
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
        if not isinstance(other, ScsOptimizer):
            return False

        return self.__dict__ == other.__dict__

    def __ne__(self, other):
        """Returns true if both objects are not equal"""
        return not self == other
