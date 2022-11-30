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

class time_reference {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.utc_time = null;
    }
    else {
      if (initObj.hasOwnProperty('utc_time')) {
        this.utc_time = initObj.utc_time
      }
      else {
        this.utc_time = {secs: 0, nsecs: 0};
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type time_reference
    // Serialize message field [utc_time]
    bufferOffset = _serializer.time(obj.utc_time, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type time_reference
    let len;
    let data = new time_reference(null);
    // Deserialize message field [utc_time]
    data.utc_time = _deserializer.time(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 8;
  }

  static datatype() {
    // Returns string type for a message object
    return 'sensor_msgs_ext/time_reference';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '3fec41e35208cc454786888579a04bcb';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    # A time measurement from a timing source.
    
    time utc_time       # The measured UTC time.
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new time_reference(null);
    if (msg.utc_time !== undefined) {
      resolved.utc_time = msg.utc_time;
    }
    else {
      resolved.utc_time = {secs: 0, nsecs: 0}
    }

    return resolved;
    }
};

module.exports = time_reference;
