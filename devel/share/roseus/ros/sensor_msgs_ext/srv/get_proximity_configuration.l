;; Auto-generated. Do not edit!


(when (boundp 'sensor_msgs_ext::get_proximity_configuration)
  (if (not (find-package "SENSOR_MSGS_EXT"))
    (make-package "SENSOR_MSGS_EXT"))
  (shadow 'get_proximity_configuration (find-package "SENSOR_MSGS_EXT")))
(unless (find-package "SENSOR_MSGS_EXT::GET_PROXIMITY_CONFIGURATION")
  (make-package "SENSOR_MSGS_EXT::GET_PROXIMITY_CONFIGURATION"))
(unless (find-package "SENSOR_MSGS_EXT::GET_PROXIMITY_CONFIGURATIONREQUEST")
  (make-package "SENSOR_MSGS_EXT::GET_PROXIMITY_CONFIGURATIONREQUEST"))
(unless (find-package "SENSOR_MSGS_EXT::GET_PROXIMITY_CONFIGURATIONRESPONSE")
  (make-package "SENSOR_MSGS_EXT::GET_PROXIMITY_CONFIGURATIONRESPONSE"))

(in-package "ROS")





(defclass sensor_msgs_ext::get_proximity_configurationRequest
  :super ros::object
  :slots ())

(defmethod sensor_msgs_ext::get_proximity_configurationRequest
  (:init
   (&key
    )
   (send-super :init)
   self)
  (:serialization-length
   ()
   (+
    0
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;;
   self)
  )

(intern "*RADIATION_TYPE_UNSPECIFIED*" (find-package "SENSOR_MSGS_EXT::GET_PROXIMITY_CONFIGURATIONRESPONSE"))
(shadow '*RADIATION_TYPE_UNSPECIFIED* (find-package "SENSOR_MSGS_EXT::GET_PROXIMITY_CONFIGURATIONRESPONSE"))
(defconstant sensor_msgs_ext::get_proximity_configurationResponse::*RADIATION_TYPE_UNSPECIFIED* 255)
(intern "*RADIATION_TYPE_ULTRASOUND*" (find-package "SENSOR_MSGS_EXT::GET_PROXIMITY_CONFIGURATIONRESPONSE"))
(shadow '*RADIATION_TYPE_ULTRASOUND* (find-package "SENSOR_MSGS_EXT::GET_PROXIMITY_CONFIGURATIONRESPONSE"))
(defconstant sensor_msgs_ext::get_proximity_configurationResponse::*RADIATION_TYPE_ULTRASOUND* 0)
(intern "*RADIATION_TYPE_INFRARED*" (find-package "SENSOR_MSGS_EXT::GET_PROXIMITY_CONFIGURATIONRESPONSE"))
(shadow '*RADIATION_TYPE_INFRARED* (find-package "SENSOR_MSGS_EXT::GET_PROXIMITY_CONFIGURATIONRESPONSE"))
(defconstant sensor_msgs_ext::get_proximity_configurationResponse::*RADIATION_TYPE_INFRARED* 1)
(intern "*RADIATION_TYPE_RADAR*" (find-package "SENSOR_MSGS_EXT::GET_PROXIMITY_CONFIGURATIONRESPONSE"))
(shadow '*RADIATION_TYPE_RADAR* (find-package "SENSOR_MSGS_EXT::GET_PROXIMITY_CONFIGURATIONRESPONSE"))
(defconstant sensor_msgs_ext::get_proximity_configurationResponse::*RADIATION_TYPE_RADAR* 2)

(defun sensor_msgs_ext::get_proximity_configurationResponse-to-symbol (const)
  (cond
        ((= const 255) 'sensor_msgs_ext::get_proximity_configurationResponse::*RADIATION_TYPE_UNSPECIFIED*)
        ((= const 0) 'sensor_msgs_ext::get_proximity_configurationResponse::*RADIATION_TYPE_ULTRASOUND*)
        ((= const 1) 'sensor_msgs_ext::get_proximity_configurationResponse::*RADIATION_TYPE_INFRARED*)
        ((= const 2) 'sensor_msgs_ext::get_proximity_configurationResponse::*RADIATION_TYPE_RADAR*)
        (t nil)))

(defclass sensor_msgs_ext::get_proximity_configurationResponse
  :super ros::object
  :slots (_radiation_type _min_range _max_range _field_of_view ))

(defmethod sensor_msgs_ext::get_proximity_configurationResponse
  (:init
   (&key
    ((:radiation_type __radiation_type) 0)
    ((:min_range __min_range) 0.0)
    ((:max_range __max_range) 0.0)
    ((:field_of_view __field_of_view) 0.0)
    )
   (send-super :init)
   (setq _radiation_type (round __radiation_type))
   (setq _min_range (float __min_range))
   (setq _max_range (float __max_range))
   (setq _field_of_view (float __field_of_view))
   self)
  (:radiation_type
   (&optional __radiation_type)
   (if __radiation_type (setq _radiation_type __radiation_type)) _radiation_type)
  (:min_range
   (&optional __min_range)
   (if __min_range (setq _min_range __min_range)) _min_range)
  (:max_range
   (&optional __max_range)
   (if __max_range (setq _max_range __max_range)) _max_range)
  (:field_of_view
   (&optional __field_of_view)
   (if __field_of_view (setq _field_of_view __field_of_view)) _field_of_view)
  (:serialization-length
   ()
   (+
    ;; uint8 _radiation_type
    1
    ;; float32 _min_range
    4
    ;; float32 _max_range
    4
    ;; float32 _field_of_view
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; uint8 _radiation_type
       (write-byte _radiation_type s)
     ;; float32 _min_range
       (sys::poke _min_range (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _max_range
       (sys::poke _max_range (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _field_of_view
       (sys::poke _field_of_view (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; uint8 _radiation_type
     (setq _radiation_type (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; float32 _min_range
     (setq _min_range (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _max_range
     (setq _max_range (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _field_of_view
     (setq _field_of_view (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;;
   self)
  )

(defclass sensor_msgs_ext::get_proximity_configuration
  :super ros::object
  :slots ())

(setf (get sensor_msgs_ext::get_proximity_configuration :md5sum-) "bc6aa8c1ba0744c7248467a89aa5b3e1")
(setf (get sensor_msgs_ext::get_proximity_configuration :datatype-) "sensor_msgs_ext/get_proximity_configuration")
(setf (get sensor_msgs_ext::get_proximity_configuration :request) sensor_msgs_ext::get_proximity_configurationRequest)
(setf (get sensor_msgs_ext::get_proximity_configuration :response) sensor_msgs_ext::get_proximity_configurationResponse)

(defmethod sensor_msgs_ext::get_proximity_configurationRequest
  (:response () (instance sensor_msgs_ext::get_proximity_configurationResponse :init)))

(setf (get sensor_msgs_ext::get_proximity_configurationRequest :md5sum-) "bc6aa8c1ba0744c7248467a89aa5b3e1")
(setf (get sensor_msgs_ext::get_proximity_configurationRequest :datatype-) "sensor_msgs_ext/get_proximity_configurationRequest")
(setf (get sensor_msgs_ext::get_proximity_configurationRequest :definition-)
      "# Retrieves the configuration of a proximity sensor.

---
uint8 radiation_type                    # The type of radiation used by the sensor.
uint8 RADIATION_TYPE_UNSPECIFIED=255
uint8 RADIATION_TYPE_ULTRASOUND=0
uint8 RADIATION_TYPE_INFRARED=1
uint8 RADIATION_TYPE_RADAR=2

float32 min_range                       # The minimum detection range of the sensor [m]
float32 max_range                       # The maximum detection range of the sensor [m]

float32 field_of_view                   # The maximum FoV of the sensor [rad]
")

(setf (get sensor_msgs_ext::get_proximity_configurationResponse :md5sum-) "bc6aa8c1ba0744c7248467a89aa5b3e1")
(setf (get sensor_msgs_ext::get_proximity_configurationResponse :datatype-) "sensor_msgs_ext/get_proximity_configurationResponse")
(setf (get sensor_msgs_ext::get_proximity_configurationResponse :definition-)
      "# Retrieves the configuration of a proximity sensor.

---
uint8 radiation_type                    # The type of radiation used by the sensor.
uint8 RADIATION_TYPE_UNSPECIFIED=255
uint8 RADIATION_TYPE_ULTRASOUND=0
uint8 RADIATION_TYPE_INFRARED=1
uint8 RADIATION_TYPE_RADAR=2

float32 min_range                       # The minimum detection range of the sensor [m]
float32 max_range                       # The maximum detection range of the sensor [m]

float32 field_of_view                   # The maximum FoV of the sensor [rad]
")



(provide :sensor_msgs_ext/get_proximity_configuration "bc6aa8c1ba0744c7248467a89aa5b3e1")


