
"use strict";

let accelerometer = require('./accelerometer.js');
let gnss_track = require('./gnss_track.js');
let axis_state = require('./axis_state.js');
let magnetometer = require('./magnetometer.js');
let gyroscope = require('./gyroscope.js');
let time_reference = require('./time_reference.js');
let gnss_position = require('./gnss_position.js');
let analog_voltage = require('./analog_voltage.js');
let temperature = require('./temperature.js');
let proximity = require('./proximity.js');
let covariance = require('./covariance.js');
let gnss_fix = require('./gnss_fix.js');

module.exports = {
  accelerometer: accelerometer,
  gnss_track: gnss_track,
  axis_state: axis_state,
  magnetometer: magnetometer,
  gyroscope: gyroscope,
  time_reference: time_reference,
  gnss_position: gnss_position,
  analog_voltage: analog_voltage,
  temperature: temperature,
  proximity: proximity,
  covariance: covariance,
  gnss_fix: gnss_fix,
};
