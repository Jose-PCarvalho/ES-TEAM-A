// Auto-generated. Do not edit!

// (in-package sensor_msgs_ext.srv)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;

//-----------------------------------------------------------


//-----------------------------------------------------------

class calibrate_gyroscopeRequest {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.averaging_period = null;
    }
    else {
      if (initObj.hasOwnProperty('averaging_period')) {
        this.averaging_period = initObj.averaging_period
      }
      else {
        this.averaging_period = 0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type calibrate_gyroscopeRequest
    // Serialize message field [averaging_period]
    bufferOffset = _serializer.uint32(obj.averaging_period, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type calibrate_gyroscopeRequest
    let len;
    let data = new calibrate_gyroscopeRequest(null);
    // Deserialize message field [averaging_period]
    data.averaging_period = _deserializer.uint32(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 4;
  }

  static datatype() {
    // Returns string type for a service object
    return 'sensor_msgs_ext/calibrate_gyroscopeRequest';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'bf0a54849407c21e7e7bc0aef95791c7';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    # Requests a zero-velocity calibration of a gyroscope.
    
    uint32 averaging_period     # The number of milliseconds to average the bias calculation over.
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new calibrate_gyroscopeRequest(null);
    if (msg.averaging_period !== undefined) {
      resolved.averaging_period = msg.averaging_period;
    }
    else {
      resolved.averaging_period = 0
    }

    return resolved;
    }
};

class calibrate_gyroscopeResponse {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.success = null;
      this.message = null;
    }
    else {
      if (initObj.hasOwnProperty('success')) {
        this.success = initObj.success
      }
      else {
        this.success = false;
      }
      if (initObj.hasOwnProperty('message')) {
        this.message = initObj.message
      }
      else {
        this.message = '';
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type calibrate_gyroscopeResponse
    // Serialize message field [success]
    bufferOffset = _serializer.bool(obj.success, buffer, bufferOffset);
    // Serialize message field [message]
    bufferOffset = _serializer.string(obj.message, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type calibrate_gyroscopeResponse
    let len;
    let data = new calibrate_gyroscopeResponse(null);
    // Deserialize message field [success]
    data.success = _deserializer.bool(buffer, bufferOffset);
    // Deserialize message field [message]
    data.message = _deserializer.string(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += _getByteLength(object.message);
    return length + 5;
  }

  static datatype() {
    // Returns string type for a service object
    return 'sensor_msgs_ext/calibrate_gyroscopeResponse';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '937c9679a518e3a18d831e57125ea522';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    bool success                # TRUE if the calibration was successful, otherwise FALSE.
    string message              # If unsuccesful, reports the reason.
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new calibrate_gyroscopeResponse(null);
    if (msg.success !== undefined) {
      resolved.success = msg.success;
    }
    else {
      resolved.success = false
    }

    if (msg.message !== undefined) {
      resolved.message = msg.message;
    }
    else {
      resolved.message = ''
    }

    return resolved;
    }
};

module.exports = {
  Request: calibrate_gyroscopeRequest,
  Response: calibrate_gyroscopeResponse,
  md5sum() { return '769e1036bf83679c0a4a88609626cccf'; },
  datatype() { return 'sensor_msgs_ext/calibrate_gyroscope'; }
};
