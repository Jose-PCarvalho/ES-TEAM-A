// Auto-generated. Do not edit!

// (in-package sensor_msgs_ext.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;

//-----------------------------------------------------------

class gnss_position {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.fix_3d = null;
      this.latitude = null;
      this.longitude = null;
      this.altitude = null;
      this.separation = null;
    }
    else {
      if (initObj.hasOwnProperty('fix_3d')) {
        this.fix_3d = initObj.fix_3d
      }
      else {
        this.fix_3d = false;
      }
      if (initObj.hasOwnProperty('latitude')) {
        this.latitude = initObj.latitude
      }
      else {
        this.latitude = 0.0;
      }
      if (initObj.hasOwnProperty('longitude')) {
        this.longitude = initObj.longitude
      }
      else {
        this.longitude = 0.0;
      }
      if (initObj.hasOwnProperty('altitude')) {
        this.altitude = initObj.altitude
      }
      else {
        this.altitude = 0.0;
      }
      if (initObj.hasOwnProperty('separation')) {
        this.separation = initObj.separation
      }
      else {
        this.separation = 0.0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type gnss_position
    // Serialize message field [fix_3d]
    bufferOffset = _serializer.bool(obj.fix_3d, buffer, bufferOffset);
    // Serialize message field [latitude]
    bufferOffset = _serializer.float64(obj.latitude, buffer, bufferOffset);
    // Serialize message field [longitude]
    bufferOffset = _serializer.float64(obj.longitude, buffer, bufferOffset);
    // Serialize message field [altitude]
    bufferOffset = _serializer.float32(obj.altitude, buffer, bufferOffset);
    // Serialize message field [separation]
    bufferOffset = _serializer.float32(obj.separation, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type gnss_position
    let len;
    let data = new gnss_position(null);
    // Deserialize message field [fix_3d]
    data.fix_3d = _deserializer.bool(buffer, bufferOffset);
    // Deserialize message field [latitude]
    data.latitude = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [longitude]
    data.longitude = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [altitude]
    data.altitude = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [separation]
    data.separation = _deserializer.float32(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 25;
  }

  static datatype() {
    // Returns string type for a message object
    return 'sensor_msgs_ext/gnss_position';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '8a8ab81d639b92d4341ee22e49a250a5';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    # A global position measurement from a GNSS sensor.
    
    bool fix_3d                 # Indicates if the fix is 3-dimensional (includes altitude/separation).
    
    float64 latitude            # Degrees latitude (positive = N, negative = S)
    float64 longitude           # Degrees longitude (positive = E, negative = W)
    float32 altitude            # Orthometric altitude above geoid/MSL [m]
    float32 separation          # Geoid separation above the ellipsoid [m]
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new gnss_position(null);
    if (msg.fix_3d !== undefined) {
      resolved.fix_3d = msg.fix_3d;
    }
    else {
      resolved.fix_3d = false
    }

    if (msg.latitude !== undefined) {
      resolved.latitude = msg.latitude;
    }
    else {
      resolved.latitude = 0.0
    }

    if (msg.longitude !== undefined) {
      resolved.longitude = msg.longitude;
    }
    else {
      resolved.longitude = 0.0
    }

    if (msg.altitude !== undefined) {
      resolved.altitude = msg.altitude;
    }
    else {
      resolved.altitude = 0.0
    }

    if (msg.separation !== undefined) {
      resolved.separation = msg.separation;
    }
    else {
      resolved.separation = 0.0
    }

    return resolved;
    }
};

module.exports = gnss_position;
