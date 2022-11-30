;; Auto-generated. Do not edit!


(when (boundp 'sensor_msgs_ext::calibrate_gyroscope)
  (if (not (find-package "SENSOR_MSGS_EXT"))
    (make-package "SENSOR_MSGS_EXT"))
  (shadow 'calibrate_gyroscope (find-package "SENSOR_MSGS_EXT")))
(unless (find-package "SENSOR_MSGS_EXT::CALIBRATE_GYROSCOPE")
  (make-package "SENSOR_MSGS_EXT::CALIBRATE_GYROSCOPE"))
(unless (find-package "SENSOR_MSGS_EXT::CALIBRATE_GYROSCOPEREQUEST")
  (make-package "SENSOR_MSGS_EXT::CALIBRATE_GYROSCOPEREQUEST"))
(unless (find-package "SENSOR_MSGS_EXT::CALIBRATE_GYROSCOPERESPONSE")
  (make-package "SENSOR_MSGS_EXT::CALIBRATE_GYROSCOPERESPONSE"))

(in-package "ROS")





(defclass sensor_msgs_ext::calibrate_gyroscopeRequest
  :super ros::object
  :slots (_averaging_period ))

(defmethod sensor_msgs_ext::calibrate_gyroscopeRequest
  (:init
   (&key
    ((:averaging_period __averaging_period) 0)
    )
   (send-super :init)
   (setq _averaging_period (round __averaging_period))
   self)
  (:averaging_period
   (&optional __averaging_period)
   (if __averaging_period (setq _averaging_period __averaging_period)) _averaging_period)
  (:serialization-length
   ()
   (+
    ;; uint32 _averaging_period
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; uint32 _averaging_period
       (write-long _averaging_period s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; uint32 _averaging_period
     (setq _averaging_period (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;;
   self)
  )

(defclass sensor_msgs_ext::calibrate_gyroscopeResponse
  :super ros::object
  :slots (_success _message ))

(defmethod sensor_msgs_ext::calibrate_gyroscopeResponse
  (:init
   (&key
    ((:success __success) nil)
    ((:message __message) "")
    )
   (send-super :init)
   (setq _success __success)
   (setq _message (string __message))
   self)
  (:success
   (&optional (__success :null))
   (if (not (eq __success :null)) (setq _success __success)) _success)
  (:message
   (&optional __message)
   (if __message (setq _message __message)) _message)
  (:serialization-length
   ()
   (+
    ;; bool _success
    1
    ;; string _message
    4 (length _message)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; bool _success
       (if _success (write-byte -1 s) (write-byte 0 s))
     ;; string _message
       (write-long (length _message) s) (princ _message s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; bool _success
     (setq _success (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;; string _message
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _message (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;;
   self)
  )

(defclass sensor_msgs_ext::calibrate_gyroscope
  :super ros::object
  :slots ())

(setf (get sensor_msgs_ext::calibrate_gyroscope :md5sum-) "769e1036bf83679c0a4a88609626cccf")
(setf (get sensor_msgs_ext::calibrate_gyroscope :datatype-) "sensor_msgs_ext/calibrate_gyroscope")
(setf (get sensor_msgs_ext::calibrate_gyroscope :request) sensor_msgs_ext::calibrate_gyroscopeRequest)
(setf (get sensor_msgs_ext::calibrate_gyroscope :response) sensor_msgs_ext::calibrate_gyroscopeResponse)

(defmethod sensor_msgs_ext::calibrate_gyroscopeRequest
  (:response () (instance sensor_msgs_ext::calibrate_gyroscopeResponse :init)))

(setf (get sensor_msgs_ext::calibrate_gyroscopeRequest :md5sum-) "769e1036bf83679c0a4a88609626cccf")
(setf (get sensor_msgs_ext::calibrate_gyroscopeRequest :datatype-) "sensor_msgs_ext/calibrate_gyroscopeRequest")
(setf (get sensor_msgs_ext::calibrate_gyroscopeRequest :definition-)
      "# Requests a zero-velocity calibration of a gyroscope.

uint32 averaging_period     # The number of milliseconds to average the bias calculation over.
---
bool success                # TRUE if the calibration was successful, otherwise FALSE.
string message              # If unsuccesful, reports the reason.
")

(setf (get sensor_msgs_ext::calibrate_gyroscopeResponse :md5sum-) "769e1036bf83679c0a4a88609626cccf")
(setf (get sensor_msgs_ext::calibrate_gyroscopeResponse :datatype-) "sensor_msgs_ext/calibrate_gyroscopeResponse")
(setf (get sensor_msgs_ext::calibrate_gyroscopeResponse :definition-)
      "# Requests a zero-velocity calibration of a gyroscope.

uint32 averaging_period     # The number of milliseconds to average the bias calculation over.
---
bool success                # TRUE if the calibration was successful, otherwise FALSE.
string message              # If unsuccesful, reports the reason.
")



(provide :sensor_msgs_ext/calibrate_gyroscope "769e1036bf83679c0a4a88609626cccf")


