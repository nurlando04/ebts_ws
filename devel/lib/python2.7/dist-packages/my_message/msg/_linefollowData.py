# This Python file uses the following encoding: utf-8
"""autogenerated by genpy from my_message/linefollowData.msg. Do not edit."""
import codecs
import sys
python3 = True if sys.hexversion > 0x03000000 else False
import genpy
import struct


class linefollowData(genpy.Message):
  _md5sum = "7500abf145475ff7fe18c643285d1df5"
  _type = "my_message/linefollowData"
  _has_header = False  # flag to mark the presence of a Header object
  _full_text = """float32 mean_squared_error
float32 y_desired
float32 y_sensed
float32 wave
int32 numoftrial"""
  __slots__ = ['mean_squared_error','y_desired','y_sensed','wave','numoftrial']
  _slot_types = ['float32','float32','float32','float32','int32']

  def __init__(self, *args, **kwds):
    """
    Constructor. Any message fields that are implicitly/explicitly
    set to None will be assigned a default value. The recommend
    use is keyword arguments as this is more robust to future message
    changes.  You cannot mix in-order arguments and keyword arguments.

    The available fields are:
       mean_squared_error,y_desired,y_sensed,wave,numoftrial

    :param args: complete set of field values, in .msg order
    :param kwds: use keyword arguments corresponding to message field names
    to set specific fields.
    """
    if args or kwds:
      super(linefollowData, self).__init__(*args, **kwds)
      # message fields cannot be None, assign default values for those that are
      if self.mean_squared_error is None:
        self.mean_squared_error = 0.
      if self.y_desired is None:
        self.y_desired = 0.
      if self.y_sensed is None:
        self.y_sensed = 0.
      if self.wave is None:
        self.wave = 0.
      if self.numoftrial is None:
        self.numoftrial = 0
    else:
      self.mean_squared_error = 0.
      self.y_desired = 0.
      self.y_sensed = 0.
      self.wave = 0.
      self.numoftrial = 0

  def _get_types(self):
    """
    internal API method
    """
    return self._slot_types

  def serialize(self, buff):
    """
    serialize message into buffer
    :param buff: buffer, ``StringIO``
    """
    try:
      _x = self
      buff.write(_get_struct_4fi().pack(_x.mean_squared_error, _x.y_desired, _x.y_sensed, _x.wave, _x.numoftrial))
    except struct.error as se: self._check_types(struct.error("%s: '%s' when writing '%s'" % (type(se), str(se), str(locals().get('_x', self)))))
    except TypeError as te: self._check_types(ValueError("%s: '%s' when writing '%s'" % (type(te), str(te), str(locals().get('_x', self)))))

  def deserialize(self, str):
    """
    unpack serialized message in str into this message instance
    :param str: byte array of serialized message, ``str``
    """
    codecs.lookup_error("rosmsg").msg_type = self._type
    try:
      end = 0
      _x = self
      start = end
      end += 20
      (_x.mean_squared_error, _x.y_desired, _x.y_sensed, _x.wave, _x.numoftrial,) = _get_struct_4fi().unpack(str[start:end])
      return self
    except struct.error as e:
      raise genpy.DeserializationError(e)  # most likely buffer underfill


  def serialize_numpy(self, buff, numpy):
    """
    serialize message with numpy array types into buffer
    :param buff: buffer, ``StringIO``
    :param numpy: numpy python module
    """
    try:
      _x = self
      buff.write(_get_struct_4fi().pack(_x.mean_squared_error, _x.y_desired, _x.y_sensed, _x.wave, _x.numoftrial))
    except struct.error as se: self._check_types(struct.error("%s: '%s' when writing '%s'" % (type(se), str(se), str(locals().get('_x', self)))))
    except TypeError as te: self._check_types(ValueError("%s: '%s' when writing '%s'" % (type(te), str(te), str(locals().get('_x', self)))))

  def deserialize_numpy(self, str, numpy):
    """
    unpack serialized message in str into this message instance using numpy for array types
    :param str: byte array of serialized message, ``str``
    :param numpy: numpy python module
    """
    codecs.lookup_error("rosmsg").msg_type = self._type
    try:
      end = 0
      _x = self
      start = end
      end += 20
      (_x.mean_squared_error, _x.y_desired, _x.y_sensed, _x.wave, _x.numoftrial,) = _get_struct_4fi().unpack(str[start:end])
      return self
    except struct.error as e:
      raise genpy.DeserializationError(e)  # most likely buffer underfill

_struct_I = genpy.struct_I
def _get_struct_I():
    global _struct_I
    return _struct_I
_struct_4fi = None
def _get_struct_4fi():
    global _struct_4fi
    if _struct_4fi is None:
        _struct_4fi = struct.Struct("<4fi")
    return _struct_4fi
