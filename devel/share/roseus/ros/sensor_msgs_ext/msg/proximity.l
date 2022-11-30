;; Auto-generated. Do not edit!


(when (boundp 'sensor_msgs_ext::proximity)
  (if (not (find-package "SENSOR_MSGS_EXT"))
    (make-package "SENSOR_MSGS_EXT"))
  (shadow 'proximity (find-package "SENSOR_MSGS_EXT")))
(unless (find-package "SENSOR_MSGS_EXT::PROXIMITY")
  (make-package "SENSOR_MSGS_EXT::PROXIMITY"))

(in-package "ROS")
;;//! \htmlinclude proximity.msg.html


(defclass sensor_msgs_ext::proximity
  :super ros::object
  :slots (_proximity ))

(defmethod sensor_msgs_ext::proximity
  (:init
   (&key
    ((:proximity __proximity) nil)
    )
   (send-super :init)
   (setq _proximity __proximity)
   self)
  (:proximity
   (&optional (__proximity :null))
   (if (not (eq __proximity :null)) (setq _proximity __proximity)) _proximity)
  (:serialization-length
   ()
   (+
    ;; bool _proximity
    1
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; bool _proximity
       (if _proximity (write-byte -1 s) (write-byte 0 s))
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; bool _proximity
     (setq _proximity (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;;
   self)
  )

(setf (get sensor_msgs_ext::proximity :md5sum-) "87ce68baa8581bc2125ed1ea8e240a58")
(setf (get sensor_msgs_ext::proximity :datatype-) "sensor_msgs_ext/proximity")
(setf (get sensor_msgs_ext::proximity :definition-)
      "# Reports the instantaneous measurement of a proximity sensor.

bool proximity              # Reports TRUE if proximity is detected, otherwise FALSE.
")



(provide :sensor_msgs_ext/proximity "87ce68baa8581bc2125ed1ea8e240a58")


