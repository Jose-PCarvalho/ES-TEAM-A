;; Auto-generated. Do not edit!


(when (boundp 'sensor_msgs_ext::time_reference)
  (if (not (find-package "SENSOR_MSGS_EXT"))
    (make-package "SENSOR_MSGS_EXT"))
  (shadow 'time_reference (find-package "SENSOR_MSGS_EXT")))
(unless (find-package "SENSOR_MSGS_EXT::TIME_REFERENCE")
  (make-package "SENSOR_MSGS_EXT::TIME_REFERENCE"))

(in-package "ROS")
;;//! \htmlinclude time_reference.msg.html


(defclass sensor_msgs_ext::time_reference
  :super ros::object
  :slots (_utc_time ))

(defmethod sensor_msgs_ext::time_reference
  (:init
   (&key
    ((:utc_time __utc_time) (instance ros::time :init))
    )
   (send-super :init)
   (setq _utc_time __utc_time)
   self)
  (:utc_time
   (&optional __utc_time)
   (if __utc_time (setq _utc_time __utc_time)) _utc_time)
  (:serialization-length
   ()
   (+
    ;; time _utc_time
    8
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; time _utc_time
       (write-long (send _utc_time :sec) s) (write-long (send _utc_time :nsec) s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; time _utc_time
     (send _utc_time :sec (sys::peek buf ptr- :integer)) (incf ptr- 4)  (send _utc_time :nsec (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;;
   self)
  )

(setf (get sensor_msgs_ext::time_reference :md5sum-) "3fec41e35208cc454786888579a04bcb")
(setf (get sensor_msgs_ext::time_reference :datatype-) "sensor_msgs_ext/time_reference")
(setf (get sensor_msgs_ext::time_reference :definition-)
      "# A time measurement from a timing source.

time utc_time       # The measured UTC time.
")



(provide :sensor_msgs_ext/time_reference "3fec41e35208cc454786888579a04bcb")


