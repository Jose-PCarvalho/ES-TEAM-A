// Auto-generated. Do not edit!

// (in-package es_vision.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;

//-----------------------------------------------------------

class seg_params {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.H_MIN = null;
      this.H_MAX = null;
      this.S_MIN = null;
      this.S_MAX = null;
      this.V_MIN = null;
      this.V_MAX = null;
    }
    else {
      if (initObj.hasOwnProperty('H_MIN')) {
        this.H_MIN = initObj.H_MIN
      }
      else {
        this.H_MIN = 0;
      }
      if (initObj.hasOwnProperty('H_MAX')) {
        this.H_MAX = initObj.H_MAX
      }
      else {
        this.H_MAX = 0;
      }
      if (initObj.hasOwnProperty('S_MIN')) {
        this.S_MIN = initObj.S_MIN
      }
      else {
        this.S_MIN = 0;
      }
      if (initObj.hasOwnProperty('S_MAX')) {
        this.S_MAX = initObj.S_MAX
      }
      else {
        this.S_MAX = 0;
      }
      if (initObj.hasOwnProperty('V_MIN')) {
        this.V_MIN = initObj.V_MIN
      }
      else {
        this.V_MIN = 0;
      }
      if (initObj.hasOwnProperty('V_MAX')) {
        this.V_MAX = initObj.V_MAX
      }
      else {
        this.V_MAX = 0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type seg_params
    // Serialize message field [H_MIN]
    bufferOffset = _serializer.uint8(obj.H_MIN, buffer, bufferOffset);
    // Serialize message field [H_MAX]
    bufferOffset = _serializer.uint8(obj.H_MAX, buffer, bufferOffset);
    // Serialize message field [S_MIN]
    bufferOffset = _serializer.uint8(obj.S_MIN, buffer, bufferOffset);
    // Serialize message field [S_MAX]
    bufferOffset = _serializer.uint8(obj.S_MAX, buffer, bufferOffset);
    // Serialize message field [V_MIN]
    bufferOffset = _serializer.uint8(obj.V_MIN, buffer, bufferOffset);
    // Serialize message field [V_MAX]
    bufferOffset = _serializer.uint8(obj.V_MAX, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type seg_params
    let len;
    let data = new seg_params(null);
    // Deserialize message field [H_MIN]
    data.H_MIN = _deserializer.uint8(buffer, bufferOffset);
    // Deserialize message field [H_MAX]
    data.H_MAX = _deserializer.uint8(buffer, bufferOffset);
    // Deserialize message field [S_MIN]
    data.S_MIN = _deserializer.uint8(buffer, bufferOffset);
    // Deserialize message field [S_MAX]
    data.S_MAX = _deserializer.uint8(buffer, bufferOffset);
    // Deserialize message field [V_MIN]
    data.V_MIN = _deserializer.uint8(buffer, bufferOffset);
    // Deserialize message field [V_MAX]
    data.V_MAX = _deserializer.uint8(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 6;
  }

  static datatype() {
    // Returns string type for a message object
    return 'es_vision/seg_params';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '2f911a5cf7426181a62067995d3f9edd';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    uint8 H_MIN
    uint8 H_MAX
    uint8 S_MIN
    uint8 S_MAX
    uint8 V_MIN
    uint8 V_MAX
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new seg_params(null);
    if (msg.H_MIN !== undefined) {
      resolved.H_MIN = msg.H_MIN;
    }
    else {
      resolved.H_MIN = 0
    }

    if (msg.H_MAX !== undefined) {
      resolved.H_MAX = msg.H_MAX;
    }
    else {
      resolved.H_MAX = 0
    }

    if (msg.S_MIN !== undefined) {
      resolved.S_MIN = msg.S_MIN;
    }
    else {
      resolved.S_MIN = 0
    }

    if (msg.S_MAX !== undefined) {
      resolved.S_MAX = msg.S_MAX;
    }
    else {
      resolved.S_MAX = 0
    }

    if (msg.V_MIN !== undefined) {
      resolved.V_MIN = msg.V_MIN;
    }
    else {
      resolved.V_MIN = 0
    }

    if (msg.V_MAX !== undefined) {
      resolved.V_MAX = msg.V_MAX;
    }
    else {
      resolved.V_MAX = 0
    }

    return resolved;
    }
};

module.exports = seg_params;
