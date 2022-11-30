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

class get_proximity_configurationRequest {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
    }
    else {
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type get_proximity_configurationRequest
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type get_proximity_configurationRequest
    let len;
    let data = new get_proximity_configurationRequest(null);
    return data;
  }

  static getMessageSize(object) {
    return 0;
  }

  static datatype() {
    // Returns string type for a service object
    return 'sensor_msgs_ext/get_proximity_configurationRequest';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'd41d8cd98f00b204e9800998ecf8427e';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    # Retrieves the configuration of a proximity sensor.
    
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new get_proximity_configurationRequest(null);
    return resolved;
    }
};

class get_proximity_configurationResponse {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.radiation_type = null;
      this.min_range = null;
      this.max_range = null;
      this.field_of_view = null;
    }
    else {
      if (initObj.hasOwnProperty('radiation_type')) {
        this.radiation_type = initObj.radiation_type
      }
      else {
        this.radiation_type = 0;
      }
      if (initObj.hasOwnProperty('min_range')) {
        this.min_range = initObj.min_range
      }
      else {
        this.min_range = 0.0;
      }
      if (initObj.hasOwnProperty('max_range')) {
        this.max_range = initObj.max_range
      }
      else {
        this.max_range = 0.0;
      }
      if (initObj.hasOwnProperty('field_of_view')) {
        this.field_of_view = initObj.field_of_view
      }
      else {
        this.field_of_view = 0.0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type get_proximity_configurationResponse
    // Serialize message field [radiation_type]
    bufferOffset = _serializer.uint8(obj.radiation_type, buffer, bufferOffset);
    // Serialize message field [min_range]
    bufferOffset = _serializer.float32(obj.min_range, buffer, bufferOffset);
    // Serialize message field [max_range]
    bufferOffset = _serializer.float32(obj.max_range, buffer, bufferOffset);
    // Serialize message field [field_of_view]
    bufferOffset = _serializer.float32(obj.field_of_view, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type get_proximity_configurationResponse
    let len;
    let data = new get_proximity_configurationResponse(null);
    // Deserialize message field [radiation_type]
    data.radiation_type = _deserializer.uint8(buffer, bufferOffset);
    // Deserialize message field [min_range]
    data.min_range = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [max_range]
    data.max_range = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [field_of_view]
    data.field_of_view = _deserializer.float32(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 13;
  }

  static datatype() {
    // Returns string type for a service object
    return 'sensor_msgs_ext/get_proximity_configurationResponse';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'bc6aa8c1ba0744c7248467a89aa5b3e1';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    uint8 radiation_type                    # The type of radiation used by the sensor.
    uint8 RADIATION_TYPE_UNSPECIFIED=255
    uint8 RADIATION_TYPE_ULTRASOUND=0
    uint8 RADIATION_TYPE_INFRARED=1
    uint8 RADIATION_TYPE_RADAR=2
    
    float32 min_range                       # The minimum detection range of the sensor [m]
    float32 max_range                       # The maximum detection range of the sensor [m]
    
    float32 field_of_view                   # The maximum FoV of the sensor [rad]
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new get_proximity_configurationResponse(null);
    if (msg.radiation_type !== undefined) {
      resolved.radiation_type = msg.radiation_type;
    }
    else {
      resolved.radiation_type = 0
    }

    if (msg.min_range !== undefined) {
      resolved.min_range = msg.min_range;
    }
    else {
      resolved.min_range = 0.0
    }

    if (msg.max_range !== undefined) {
      resolved.max_range = msg.max_range;
    }
    else {
      resolved.max_range = 0.0
    }

    if (msg.field_of_view !== undefined) {
      resolved.field_of_view = msg.field_of_view;
    }
    else {
      resolved.field_of_view = 0.0
    }

    return resolved;
    }
};

// Constants for message
get_proximity_configurationResponse.Constants = {
  RADIATION_TYPE_UNSPECIFIED: 255,
  RADIATION_TYPE_ULTRASOUND: 0,
  RADIATION_TYPE_INFRARED: 1,
  RADIATION_TYPE_RADAR: 2,
}

module.exports = {
  Request: get_proximity_configurationRequest,
  Response: get_proximity_configurationResponse,
  md5sum() { return 'bc6aa8c1ba0744c7248467a89aa5b3e1'; },
  datatype() { return 'sensor_msgs_ext/get_proximity_configuration'; }
};
