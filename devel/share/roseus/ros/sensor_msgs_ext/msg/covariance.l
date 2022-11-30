;; Auto-generated. Do not edit!


(when (boundp 'sensor_msgs_ext::covariance)
  (if (not (find-package "SENSOR_MSGS_EXT"))
    (make-package "SENSOR_MSGS_EXT"))
  (shadow 'covariance (find-package "SENSOR_MSGS_EXT")))
(unless (find-package "SENSOR_MSGS_EXT::COVARIANCE")
  (make-package "SENSOR_MSGS_EXT::COVARIANCE"))

(in-package "ROS")
;;//! \htmlinclude covariance.msg.html


(defclass sensor_msgs_ext::covariance
  :super ros::object
  :slots (_dimensions _covariance ))

(defmethod sensor_msgs_ext::covariance
  (:init
   (&key
    ((:dimensions __dimensions) 0)
    ((:covariance __covariance) (make-array 0 :initial-element 0.0 :element-type :float))
    )
   (send-super :init)
   (setq _dimensions (round __dimensions))
   (setq _covariance __covariance)
   self)
  (:dimensions
   (&optional __dimensions)
   (if __dimensions (setq _dimensions __dimensions)) _dimensions)
  (:covariance
   (&optional __covariance)
   (if __covariance (setq _covariance __covariance)) _covariance)
  (:serialization-length
   ()
   (+
    ;; uint32 _dimensions
    4
    ;; float64[] _covariance
    (* 8    (length _covariance)) 4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; uint32 _dimensions
       (write-long _dimensions s)
     ;; float64[] _covariance
     (write-long (length _covariance) s)
     (dotimes (i (length _covariance))
       (sys::poke (elt _covariance i) (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
       )
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; uint32 _dimensions
     (setq _dimensions (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; float64[] _covariance
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _covariance (instantiate float-vector n))
     (dotimes (i n)
     (setf (elt _covariance i) (sys::peek buf ptr- :double)) (incf ptr- 8)
     ))
   ;;
   self)
  )

(setf (get sensor_msgs_ext::covariance :md5sum-) "a8fe301b0f306d03958ddc38bec90d10")
(setf (get sensor_msgs_ext::covariance :datatype-) "sensor_msgs_ext/covariance")
(setf (get sensor_msgs_ext::covariance :definition-)
      "# The covariance matrix for a sensor measurement.

uint32 dimensions           # The number of independent measurements represented by the covariance matrix.
float64[] covariance        # The covariance matrix in row-major order.
")



(provide :sensor_msgs_ext/covariance "a8fe301b0f306d03958ddc38bec90d10")


