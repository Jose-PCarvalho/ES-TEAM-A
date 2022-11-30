;; Auto-generated. Do not edit!


(when (boundp 'sensor_msgs_ext::temperature)
  (if (not (find-package "SENSOR_MSGS_EXT"))
    (make-package "SENSOR_MSGS_EXT"))
  (shadow 'temperature (find-package "SENSOR_MSGS_EXT")))
(unless (find-package "SENSOR_MSGS_EXT::TEMPERATURE")
  (make-package "SENSOR_MSGS_EXT::TEMPERATURE"))

(in-package "ROS")
;;//! \htmlinclude temperature.msg.html


(defclass sensor_msgs_ext::temperature
  :super ros::object
  :slots (_temperature ))

(defmethod sensor_msgs_ext::temperature
  (:init
   (&key
    ((:temperature __temperature) 0.0)
    )
   (send-super :init)
   (setq _temperature (float __temperature))
   self)
  (:temperature
   (&optional __temperature)
   (if __temperature (setq _temperature __temperature)) _temperature)
  (:serialization-length
   ()
   (+
    ;; float64 _temperature
    8
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; float64 _temperature
       (sys::poke _temperature (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; float64 _temperature
     (setq _temperature (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;;
   self)
  )

(setf (get sensor_msgs_ext::temperature :md5sum-) "3d36f909fc0be819c991c4abdee75a2b")
(setf (get sensor_msgs_ext::temperature :datatype-) "sensor_msgs_ext/temperature")
(setf (get sensor_msgs_ext::temperature :definition-)
      "# Indicates an instantaneous temperature reading.

float64 temperature     # The measured temperature [C]
")



(provide :sensor_msgs_ext/temperature "3d36f909fc0be819c991c4abdee75a2b")


