// Auto-generated. Do not edit!

// (in-package franka_custom_control.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;

//-----------------------------------------------------------

class linefollowData {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.mean_squared_error = null;
      this.y_sensed = null;
      this.y_desired = null;
    }
    else {
      if (initObj.hasOwnProperty('mean_squared_error')) {
        this.mean_squared_error = initObj.mean_squared_error
      }
      else {
        this.mean_squared_error = 0.0;
      }
      if (initObj.hasOwnProperty('y_sensed')) {
        this.y_sensed = initObj.y_sensed
      }
      else {
        this.y_sensed = 0.0;
      }
      if (initObj.hasOwnProperty('y_desired')) {
        this.y_desired = initObj.y_desired
      }
      else {
        this.y_desired = 0.0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type linefollowData
    // Serialize message field [mean_squared_error]
    bufferOffset = _serializer.float32(obj.mean_squared_error, buffer, bufferOffset);
    // Serialize message field [y_sensed]
    bufferOffset = _serializer.float32(obj.y_sensed, buffer, bufferOffset);
    // Serialize message field [y_desired]
    bufferOffset = _serializer.float32(obj.y_desired, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type linefollowData
    let len;
    let data = new linefollowData(null);
    // Deserialize message field [mean_squared_error]
    data.mean_squared_error = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [y_sensed]
    data.y_sensed = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [y_desired]
    data.y_desired = _deserializer.float32(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 12;
  }

  static datatype() {
    // Returns string type for a message object
    return 'franka_custom_control/linefollowData';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '56d6b7140d97f10c0e7ce09693345f49';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    float32 mean_squared_error
    float32 y_sensed
    float32 y_desired
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new linefollowData(null);
    if (msg.mean_squared_error !== undefined) {
      resolved.mean_squared_error = msg.mean_squared_error;
    }
    else {
      resolved.mean_squared_error = 0.0
    }

    if (msg.y_sensed !== undefined) {
      resolved.y_sensed = msg.y_sensed;
    }
    else {
      resolved.y_sensed = 0.0
    }

    if (msg.y_desired !== undefined) {
      resolved.y_desired = msg.y_desired;
    }
    else {
      resolved.y_desired = 0.0
    }

    return resolved;
    }
};

module.exports = linefollowData;
