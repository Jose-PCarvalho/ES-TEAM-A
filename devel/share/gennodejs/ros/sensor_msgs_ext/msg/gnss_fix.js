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

class gnss_fix {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.type = null;
      this.mode_selection = null;
      this.mode = null;
      this.satellite_count = null;
    }
    else {
      if (initObj.hasOwnProperty('type')) {
        this.type = initObj.type
      }
      else {
        this.type = 0;
      }
      if (initObj.hasOwnProperty('mode_selection')) {
        this.mode_selection = initObj.mode_selection
      }
      else {
        this.mode_selection = 0;
      }
      if (initObj.hasOwnProperty('mode')) {
        this.mode = initObj.mode
      }
      else {
        this.mode = 0;
      }
      if (initObj.hasOwnProperty('satellite_count')) {
        this.satellite_count = initObj.satellite_count
      }
      else {
        this.satellite_count = 0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type gnss_fix
    // Serialize message field [type]
    bufferOffset = _serializer.uint8(obj.type, buffer, bufferOffset);
    // Serialize message field [mode_selection]
    bufferOffset = _serializer.uint8(obj.mode_selection, buffer, bufferOffset);
    // Serialize message field [mode]
    bufferOffset = _serializer.uint8(obj.mode, buffer, bufferOffset);
    // Serialize message field [satellite_count]
    bufferOffset = _serializer.uint8(obj.satellite_count, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type gnss_fix
    let len;
    let data = new gnss_fix(null);
    // Deserialize message field [type]
    data.type = _deserializer.uint8(buffer, bufferOffset);
    // Deserialize message field [mode_selection]
    data.mode_selection = _deserializer.uint8(buffer, bufferOffset);
    // Deserialize message field [mode]
    data.mode = _deserializer.uint8(buffer, bufferOffset);
    // Deserialize message field [satellite_count]
    data.satellite_count = _deserializer.uint8(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 4;
  }

  static datatype() {
    // Returns string type for a message object
    return 'sensor_msgs_ext/gnss_fix';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'ac20d1087808fbd5ae6cee3e0e0bee4d';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    # Describes the status of a GNSS receiver's fix.
    
    uint8 type                            # The current fix type.
    uint8 TYPE_NO_FIX = 0
    uint8 TYPE_FIX = 1
    uint8 TYPE_DIFFERENTIAL = 2
    uint8 TYPE_RTK_FIXED = 4
    uint8 TYPE_RTK_FLOAT = 5
    uint8 TYPE_DEAD_RECKONING = 6
    
    uint8 mode_selection                  # The selection type for the operating mode.
    uint8 MODE_SELECTION_MANUAL = 0
    uint8 MODE_SELECTION_AUTOMATIC = 1
    
    uint8 mode                            # The current operating mode.
    uint8 MODE_NONE = 0
    uint8 MODE_2D = 1
    uint8 MODE_3D = 2
    
    uint8 satellite_count                 # The number of satellites used in the fix solution.
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new gnss_fix(null);
    if (msg.type !== undefined) {
      resolved.type = msg.type;
    }
    else {
      resolved.type = 0
    }

    if (msg.mode_selection !== undefined) {
      resolved.mode_selection = msg.mode_selection;
    }
    else {
      resolved.mode_selection = 0
    }

    if (msg.mode !== undefined) {
      resolved.mode = msg.mode;
    }
    else {
      resolved.mode = 0
    }

    if (msg.satellite_count !== undefined) {
      resolved.satellite_count = msg.satellite_count;
    }
    else {
      resolved.satellite_count = 0
    }

    return resolved;
    }
};

// Constants for message
gnss_fix.Constants = {
  TYPE_NO_FIX: 0,
  TYPE_FIX: 1,
  TYPE_DIFFERENTIAL: 2,
  TYPE_RTK_FIXED: 4,
  TYPE_RTK_FLOAT: 5,
  TYPE_DEAD_RECKONING: 6,
  MODE_SELECTION_MANUAL: 0,
  MODE_SELECTION_AUTOMATIC: 1,
  MODE_NONE: 0,
  MODE_2D: 1,
  MODE_3D: 2,
}

module.exports = gnss_fix;
