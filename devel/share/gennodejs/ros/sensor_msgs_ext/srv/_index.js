
"use strict";

let calibrate_gyroscope = require('./calibrate_gyroscope.js')
let set_axis_home = require('./set_axis_home.js')
let get_proximity_configuration = require('./get_proximity_configuration.js')

module.exports = {
  calibrate_gyroscope: calibrate_gyroscope,
  set_axis_home: set_axis_home,
  get_proximity_configuration: get_proximity_configuration,
};
