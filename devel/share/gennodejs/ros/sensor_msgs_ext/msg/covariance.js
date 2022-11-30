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

class covariance {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.dimensions = null;
      this.covariance = null;
    }
    else {
      if (initObj.hasOwnProperty('dimensions')) {
        this.dimensions = initObj.dimensions
      }
      else {
        this.dimensions = 0;
      }
      if (initObj.hasOwnProperty('covariance')) {
        this.covariance = initObj.covariance
      }
      else {
        this.covariance = [];
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type covariance
    // Serialize message field [dimensions]
    bufferOffset = _serializer.uint32(obj.dimensions, buffer, bufferOffset);
    // Serialize message field [covariance]
    bufferOffset = _arraySerializer.float64(obj.covariance, buffer, bufferOffset, null);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type covariance
    let len;
    let data = new covariance(null);
    // Deserialize message field [dimensions]
    data.dimensions = _deserializer.uint32(buffer, bufferOffset);
    // Deserialize message field [covariance]
    data.covariance = _arrayDeserializer.float64(buffer, bufferOffset, null)
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += 8 * object.covariance.length;
    return length + 8;
  }

  static datatype() {
    // Returns string type for a message object
    return 'sensor_msgs_ext/covariance';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'a8fe301b0f306d03958ddc38bec90d10';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    # The covariance matrix for a sensor measurement.
    
    uint32 dimensions           # The number of independent measurements represented by the covariance matrix.
    float64[] covariance        # The covariance matrix in row-major order.
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new covariance(null);
    if (msg.dimensions !== undefined) {
      resolved.dimensions = msg.dimensions;
    }
    else {
      resolved.dimensions = 0
    }

    if (msg.covariance !== undefined) {
      resolved.covariance = msg.covariance;
    }
    else {
      resolved.covariance = []
    }

    return resolved;
    }
};

module.exports = covariance;
