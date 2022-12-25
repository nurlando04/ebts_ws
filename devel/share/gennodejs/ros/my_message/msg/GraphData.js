// Auto-generated. Do not edit!

// (in-package my_message.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;

//-----------------------------------------------------------

class GraphData {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.ms_error = null;
      this.force_desired = null;
      this.force_event = null;
      this.force_weiss = null;
      this.force_robot = null;
      this.force_weiss2 = null;
      this.delta_z = null;
      this.desire_ar = null;
      this.sense_ar = null;
    }
    else {
      if (initObj.hasOwnProperty('ms_error')) {
        this.ms_error = initObj.ms_error
      }
      else {
        this.ms_error = 0.0;
      }
      if (initObj.hasOwnProperty('force_desired')) {
        this.force_desired = initObj.force_desired
      }
      else {
        this.force_desired = 0.0;
      }
      if (initObj.hasOwnProperty('force_event')) {
        this.force_event = initObj.force_event
      }
      else {
        this.force_event = 0.0;
      }
      if (initObj.hasOwnProperty('force_weiss')) {
        this.force_weiss = initObj.force_weiss
      }
      else {
        this.force_weiss = 0.0;
      }
      if (initObj.hasOwnProperty('force_robot')) {
        this.force_robot = initObj.force_robot
      }
      else {
        this.force_robot = 0.0;
      }
      if (initObj.hasOwnProperty('force_weiss2')) {
        this.force_weiss2 = initObj.force_weiss2
      }
      else {
        this.force_weiss2 = 0.0;
      }
      if (initObj.hasOwnProperty('delta_z')) {
        this.delta_z = initObj.delta_z
      }
      else {
        this.delta_z = 0.0;
      }
      if (initObj.hasOwnProperty('desire_ar')) {
        this.desire_ar = initObj.desire_ar
      }
      else {
        this.desire_ar = 0.0;
      }
      if (initObj.hasOwnProperty('sense_ar')) {
        this.sense_ar = initObj.sense_ar
      }
      else {
        this.sense_ar = 0.0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type GraphData
    // Serialize message field [ms_error]
    bufferOffset = _serializer.float32(obj.ms_error, buffer, bufferOffset);
    // Serialize message field [force_desired]
    bufferOffset = _serializer.float64(obj.force_desired, buffer, bufferOffset);
    // Serialize message field [force_event]
    bufferOffset = _serializer.float32(obj.force_event, buffer, bufferOffset);
    // Serialize message field [force_weiss]
    bufferOffset = _serializer.float64(obj.force_weiss, buffer, bufferOffset);
    // Serialize message field [force_robot]
    bufferOffset = _serializer.float32(obj.force_robot, buffer, bufferOffset);
    // Serialize message field [force_weiss2]
    bufferOffset = _serializer.float64(obj.force_weiss2, buffer, bufferOffset);
    // Serialize message field [delta_z]
    bufferOffset = _serializer.float64(obj.delta_z, buffer, bufferOffset);
    // Serialize message field [desire_ar]
    bufferOffset = _serializer.float32(obj.desire_ar, buffer, bufferOffset);
    // Serialize message field [sense_ar]
    bufferOffset = _serializer.float32(obj.sense_ar, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type GraphData
    let len;
    let data = new GraphData(null);
    // Deserialize message field [ms_error]
    data.ms_error = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [force_desired]
    data.force_desired = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [force_event]
    data.force_event = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [force_weiss]
    data.force_weiss = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [force_robot]
    data.force_robot = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [force_weiss2]
    data.force_weiss2 = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [delta_z]
    data.delta_z = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [desire_ar]
    data.desire_ar = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [sense_ar]
    data.sense_ar = _deserializer.float32(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 52;
  }

  static datatype() {
    // Returns string type for a message object
    return 'my_message/GraphData';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'ba85a4112f52168dcee52ccd937505d2';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    float32 ms_error 
    float64 force_desired
    float32 force_event
    float64 force_weiss
    float32 force_robot
    float64 force_weiss2
    float64 delta_z
    float32 desire_ar
    float32 sense_ar
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new GraphData(null);
    if (msg.ms_error !== undefined) {
      resolved.ms_error = msg.ms_error;
    }
    else {
      resolved.ms_error = 0.0
    }

    if (msg.force_desired !== undefined) {
      resolved.force_desired = msg.force_desired;
    }
    else {
      resolved.force_desired = 0.0
    }

    if (msg.force_event !== undefined) {
      resolved.force_event = msg.force_event;
    }
    else {
      resolved.force_event = 0.0
    }

    if (msg.force_weiss !== undefined) {
      resolved.force_weiss = msg.force_weiss;
    }
    else {
      resolved.force_weiss = 0.0
    }

    if (msg.force_robot !== undefined) {
      resolved.force_robot = msg.force_robot;
    }
    else {
      resolved.force_robot = 0.0
    }

    if (msg.force_weiss2 !== undefined) {
      resolved.force_weiss2 = msg.force_weiss2;
    }
    else {
      resolved.force_weiss2 = 0.0
    }

    if (msg.delta_z !== undefined) {
      resolved.delta_z = msg.delta_z;
    }
    else {
      resolved.delta_z = 0.0
    }

    if (msg.desire_ar !== undefined) {
      resolved.desire_ar = msg.desire_ar;
    }
    else {
      resolved.desire_ar = 0.0
    }

    if (msg.sense_ar !== undefined) {
      resolved.sense_ar = msg.sense_ar;
    }
    else {
      resolved.sense_ar = 0.0
    }

    return resolved;
    }
};

module.exports = GraphData;
