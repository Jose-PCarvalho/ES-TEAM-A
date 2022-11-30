;; Auto-generated. Do not edit!


(when (boundp 'sensor_msgs_ext::accelerometer)
  (if (not (find-package "SENSOR_MSGS_EXT"))
    (make-package "SENSOR_MSGS_EXT"))
  (shadow 'accelerometer (find-package "SENSOR_MSGS_EXT")))
(unless (find-package "SENSOR_MSGS_EXT::ACCELEROMETER")
  (make-package "SENSOR_MSGS_EXT::ACCELEROMETER"))

(in-package "ROS")
;;//! \htmlinclude accelerometer.msg.html


(defclass sensor_msgs_ext::accelerometer
  :super ros::object
  :slots (_x _y _z ))

(defmethod sensor_msgs_ext::accelerometer
  (:init
   (&key
    ((:x __x) 0.0)
    ((:y __y) 0.0)
    ((:z __z) 0.0)
    )
   (send-super :init)
   (setq _x (float __x))
   (setq _y (float __y))
   (setq _z (float __z))
   self)
  (:x
   (&optional __x)
   (if __x (setq _x __x)) _x)
  (:y
   (&optional __y)
   (if __y (setq _y __y)) _y)
  (:z
   (&optional __z)
   (if __z (setq _z __z)) _z)
  (:serialization-length
   ()
   (+
    ;; float64 _x
    8
    ;; float64 _y
    8
    ;; float64 _z
    8
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; float64 _x
       (sys::poke _x (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _y
       (sys::poke _y (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _z
       (sys::poke _z (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; float64 _x
     (setq _x (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _y
     (setq _y (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _z
     (setq _z (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;;
   self)
  )

(setf (get sensor_msgs_ext::accelerometer :md5sum-) "4a842b65f413084dc2b10fb484ea7f17")
(setf (get sensor_msgs_ext::accelerometer :datatype-) "sensor_msgs_ext/accelerometer")
(setf (get sensor_msgs_ext::accelerometer :definition-)
      "# A 3D measurement of linear acceleration from an 3-axis accelerometer.

float64 x           # The linear acceleration in the X direction [m/s^2]
float64 y           # The linear acceleration in the Y direction [m/s^2]
float64 z           # The linear acceleration in the Z direction [m/s^2]
")



(provide :sensor_msgs_ext/accelerometer "4a842b65f413084dc2b10fb484ea7f17")


