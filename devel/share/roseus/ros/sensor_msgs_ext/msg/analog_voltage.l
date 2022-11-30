;; Auto-generated. Do not edit!


(when (boundp 'sensor_msgs_ext::analog_voltage)
  (if (not (find-package "SENSOR_MSGS_EXT"))
    (make-package "SENSOR_MSGS_EXT"))
  (shadow 'analog_voltage (find-package "SENSOR_MSGS_EXT")))
(unless (find-package "SENSOR_MSGS_EXT::ANALOG_VOLTAGE")
  (make-package "SENSOR_MSGS_EXT::ANALOG_VOLTAGE"))

(in-package "ROS")
;;//! \htmlinclude analog_voltage.msg.html


(defclass sensor_msgs_ext::analog_voltage
  :super ros::object
  :slots (_voltage ))

(defmethod sensor_msgs_ext::analog_voltage
  (:init
   (&key
    ((:voltage __voltage) 0.0)
    )
   (send-super :init)
   (setq _voltage (float __voltage))
   self)
  (:voltage
   (&optional __voltage)
   (if __voltage (setq _voltage __voltage)) _voltage)
  (:serialization-length
   ()
   (+
    ;; float64 _voltage
    8
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; float64 _voltage
       (sys::poke _voltage (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; float64 _voltage
     (setq _voltage (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;;
   self)
  )

(setf (get sensor_msgs_ext::analog_voltage :md5sum-) "cd1e97d74e6d797b46bc5a51e820e6ae")
(setf (get sensor_msgs_ext::analog_voltage :datatype-) "sensor_msgs_ext/analog_voltage")
(setf (get sensor_msgs_ext::analog_voltage :definition-)
      "# Reports an analog voltage measurements.

float64 voltage     # The measured analog voltage [v]
")



(provide :sensor_msgs_ext/analog_voltage "cd1e97d74e6d797b46bc5a51e820e6ae")


