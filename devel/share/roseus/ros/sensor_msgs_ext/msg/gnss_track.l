;; Auto-generated. Do not edit!


(when (boundp 'sensor_msgs_ext::gnss_track)
  (if (not (find-package "SENSOR_MSGS_EXT"))
    (make-package "SENSOR_MSGS_EXT"))
  (shadow 'gnss_track (find-package "SENSOR_MSGS_EXT")))
(unless (find-package "SENSOR_MSGS_EXT::GNSS_TRACK")
  (make-package "SENSOR_MSGS_EXT::GNSS_TRACK"))

(in-package "ROS")
;;//! \htmlinclude gnss_track.msg.html


(intern "*REFERENCE_TRUE_NORTH*" (find-package "SENSOR_MSGS_EXT::GNSS_TRACK"))
(shadow '*REFERENCE_TRUE_NORTH* (find-package "SENSOR_MSGS_EXT::GNSS_TRACK"))
(defconstant sensor_msgs_ext::gnss_track::*REFERENCE_TRUE_NORTH* 0)
(intern "*REFERENCE_MAGNETIC_NORTH*" (find-package "SENSOR_MSGS_EXT::GNSS_TRACK"))
(shadow '*REFERENCE_MAGNETIC_NORTH* (find-package "SENSOR_MSGS_EXT::GNSS_TRACK"))
(defconstant sensor_msgs_ext::gnss_track::*REFERENCE_MAGNETIC_NORTH* 1)

(defun sensor_msgs_ext::gnss_track-to-symbol (const)
  (cond
        ((= const 0) 'sensor_msgs_ext::gnss_track::*REFERENCE_TRUE_NORTH*)
        ((= const 1) 'sensor_msgs_ext::gnss_track::*REFERENCE_MAGNETIC_NORTH*)
        (t nil)))

(defclass sensor_msgs_ext::gnss_track
  :super ros::object
  :slots (_reference _heading _speed ))

(defmethod sensor_msgs_ext::gnss_track
  (:init
   (&key
    ((:reference __reference) 0)
    ((:heading __heading) 0.0)
    ((:speed __speed) 0.0)
    )
   (send-super :init)
   (setq _reference (round __reference))
   (setq _heading (float __heading))
   (setq _speed (float __speed))
   self)
  (:reference
   (&optional __reference)
   (if __reference (setq _reference __reference)) _reference)
  (:heading
   (&optional __heading)
   (if __heading (setq _heading __heading)) _heading)
  (:speed
   (&optional __speed)
   (if __speed (setq _speed __speed)) _speed)
  (:serialization-length
   ()
   (+
    ;; uint8 _reference
    1
    ;; float64 _heading
    8
    ;; float64 _speed
    8
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; uint8 _reference
       (write-byte _reference s)
     ;; float64 _heading
       (sys::poke _heading (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _speed
       (sys::poke _speed (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; uint8 _reference
     (setq _reference (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; float64 _heading
     (setq _heading (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _speed
     (setq _speed (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;;
   self)
  )

(setf (get sensor_msgs_ext::gnss_track :md5sum-) "81e644c78713ede189d0f70c2953dc7b")
(setf (get sensor_msgs_ext::gnss_track :datatype-) "sensor_msgs_ext/gnss_track")
(setf (get sensor_msgs_ext::gnss_track :definition-)
      "# An instantaneous velocity track as measured by a GNSS receiver.

uint8 reference                       # The direction that the heading is in reference to.
uint8 REFERENCE_TRUE_NORTH = 0
uint8 REFERENCE_MAGNETIC_NORTH = 1

float64 heading                         # The global heading of the track w.r.t. the reference [rad].
float64 speed                           # The scalar speed of the track, [m/s]
")



(provide :sensor_msgs_ext/gnss_track "81e644c78713ede189d0f70c2953dc7b")


