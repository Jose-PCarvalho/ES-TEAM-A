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

class gnss_track {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.reference = null;
      this.heading = null;
      this.speed = null;
    }
    else {
      if (initObj.hasOwnProperty('reference')) {
        this.reference = initObj.reference
      }
      else {
        this.reference = 0;
      }
      if (initObj.hasOwnProperty('heading')) {
        this.heading = initObj.heading
      }
      else {
        this.heading = 0.0;
      }
      if (initObj.hasOwnProperty('speed')) {
        this.speed = initObj.speed
      }
      else {
        this.speed = 0.0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type gnss_track
    // Serialize message field [reference]
    bufferOffset = _serializer.uint8(obj.reference, buffer, bufferOffset);
    // Serialize message field [heading]
    bufferOffset = _serializer.float64(obj.heading, buffer, bufferOffset);
    // Serialize message field [speed]
    bufferOffset = _serializer.float64(obj.speed, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type gnss_track
    let len;
    let data = new gnss_track(null);
    // Deserialize message field [reference]
    data.reference = _deserializer.uint8(buffer, bufferOffset);
    // Deserialize message field [heading]
    data.heading = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [speed]
    data.speed = _deserializer.float64(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 17;
  }

  static datatype() {
    // Returns string type for a message object
    return 'sensor_msgs_ext/gnss_track';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '81e644c78713ede189d0f70c2953dc7b';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    # An instantaneous velocity track as measured by a GNSS receiver.
    
    uint8 reference                       # The direction that the heading is in reference to.
    uint8 REFERENCE_TRUE_NORTH = 0
    uint8 REFERENCE_MAGNETIC_NORTH = 1
    
    float64 heading                         # The global heading of the track w.r.t. the reference [rad].
    float64 speed                           # The scalar speed of the track, [m/s]
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new gnss_track(null);
    if (msg.reference !== undefined) {
      resolved.reference = msg.reference;
    }
    else {
      resolved.reference = 0
    }

    if (msg.heading !== undefined) {
      resolved.heading = msg.heading;
    }
    else {
      resolved.heading = 0.0
    }

    if (msg.speed !== undefined) {
      resolved.speed = msg.speed;
    }
    else {
      resolved.speed = 0.0
    }

    return resolved;
    }
};

// Constants for message
gnss_track.Constants = {
  REFERENCE_TRUE_NORTH: 0,
  REFERENCE_MAGNETIC_NORTH: 1,
}

module.exports = gnss_track;
