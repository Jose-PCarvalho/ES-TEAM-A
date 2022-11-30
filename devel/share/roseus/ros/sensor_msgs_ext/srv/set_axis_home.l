;; Auto-generated. Do not edit!


(when (boundp 'sensor_msgs_ext::set_axis_home)
  (if (not (find-package "SENSOR_MSGS_EXT"))
    (make-package "SENSOR_MSGS_EXT"))
  (shadow 'set_axis_home (find-package "SENSOR_MSGS_EXT")))
(unless (find-package "SENSOR_MSGS_EXT::SET_AXIS_HOME")
  (make-package "SENSOR_MSGS_EXT::SET_AXIS_HOME"))
(unless (find-package "SENSOR_MSGS_EXT::SET_AXIS_HOMEREQUEST")
  (make-package "SENSOR_MSGS_EXT::SET_AXIS_HOMEREQUEST"))
(unless (find-package "SENSOR_MSGS_EXT::SET_AXIS_HOMERESPONSE")
  (make-package "SENSOR_MSGS_EXT::SET_AXIS_HOMERESPONSE"))

(in-package "ROS")





(defclass sensor_msgs_ext::set_axis_homeRequest
  :super ros::object
  :slots ())

(defmethod sensor_msgs_ext::set_axis_homeRequest
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

(defclass sensor_msgs_ext::set_axis_homeResponse
  :super ros::object
  :slots ())

(defmethod sensor_msgs_ext::set_axis_homeResponse
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

(defclass sensor_msgs_ext::set_axis_home
  :super ros::object
  :slots ())

(setf (get sensor_msgs_ext::set_axis_home :md5sum-) "d41d8cd98f00b204e9800998ecf8427e")
(setf (get sensor_msgs_ext::set_axis_home :datatype-) "sensor_msgs_ext/set_axis_home")
(setf (get sensor_msgs_ext::set_axis_home :request) sensor_msgs_ext::set_axis_homeRequest)
(setf (get sensor_msgs_ext::set_axis_home :response) sensor_msgs_ext::set_axis_homeResponse)

(defmethod sensor_msgs_ext::set_axis_homeRequest
  (:response () (instance sensor_msgs_ext::set_axis_homeResponse :init)))

(setf (get sensor_msgs_ext::set_axis_homeRequest :md5sum-) "d41d8cd98f00b204e9800998ecf8427e")
(setf (get sensor_msgs_ext::set_axis_homeRequest :datatype-) "sensor_msgs_ext/set_axis_homeRequest")
(setf (get sensor_msgs_ext::set_axis_homeRequest :definition-)
      "# Sets the home position of the axis to it's current position.

---
")

(setf (get sensor_msgs_ext::set_axis_homeResponse :md5sum-) "d41d8cd98f00b204e9800998ecf8427e")
(setf (get sensor_msgs_ext::set_axis_homeResponse :datatype-) "sensor_msgs_ext/set_axis_homeResponse")
(setf (get sensor_msgs_ext::set_axis_homeResponse :definition-)
      "# Sets the home position of the axis to it's current position.

---
")



(provide :sensor_msgs_ext/set_axis_home "d41d8cd98f00b204e9800998ecf8427e")


