;; Auto-generated. Do not edit!


(when (boundp 'sensor_msgs_ext::gnss_position)
  (if (not (find-package "SENSOR_MSGS_EXT"))
    (make-package "SENSOR_MSGS_EXT"))
  (shadow 'gnss_position (find-package "SENSOR_MSGS_EXT")))
(unless (find-package "SENSOR_MSGS_EXT::GNSS_POSITION")
  (make-package "SENSOR_MSGS_EXT::GNSS_POSITION"))

(in-package "ROS")
;;//! \htmlinclude gnss_position.msg.html


(defclass sensor_msgs_ext::gnss_position
  :super ros::object
  :slots (_fix_3d _latitude _longitude _altitude _separation ))

(defmethod sensor_msgs_ext::gnss_position
  (:init
   (&key
    ((:fix_3d __fix_3d) nil)
    ((:latitude __latitude) 0.0)
    ((:longitude __longitude) 0.0)
    ((:altitude __altitude) 0.0)
    ((:separation __separation) 0.0)
    )
   (send-super :init)
   (setq _fix_3d __fix_3d)
   (setq _latitude (float __latitude))
   (setq _longitude (float __longitude))
   (setq _altitude (float __altitude))
   (setq _separation (float __separation))
   self)
  (:fix_3d
   (&optional (__fix_3d :null))
   (if (not (eq __fix_3d :null)) (setq _fix_3d __fix_3d)) _fix_3d)
  (:latitude
   (&optional __latitude)
   (if __latitude (setq _latitude __latitude)) _latitude)
  (:longitude
   (&optional __longitude)
   (if __longitude (setq _longitude __longitude)) _longitude)
  (:altitude
   (&optional __altitude)
   (if __altitude (setq _altitude __altitude)) _altitude)
  (:separation
   (&optional __separation)
   (if __separation (setq _separation __separation)) _separation)
  (:serialization-length
   ()
   (+
    ;; bool _fix_3d
    1
    ;; float64 _latitude
    8
    ;; float64 _longitude
    8
    ;; float32 _altitude
    4
    ;; float32 _separation
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; bool _fix_3d
       (if _fix_3d (write-byte -1 s) (write-byte 0 s))
     ;; float64 _latitude
       (sys::poke _latitude (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _longitude
       (sys::poke _longitude (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float32 _altitude
       (sys::poke _altitude (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _separation
       (sys::poke _separation (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; bool _fix_3d
     (setq _fix_3d (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;; float64 _latitude
     (setq _latitude (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _longitude
     (setq _longitude (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float32 _altitude
     (setq _altitude (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _separation
     (setq _separation (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;;
   self)
  )

(setf (get sensor_msgs_ext::gnss_position :md5sum-) "8a8ab81d639b92d4341ee22e49a250a5")
(setf (get sensor_msgs_ext::gnss_position :datatype-) "sensor_msgs_ext/gnss_position")
(setf (get sensor_msgs_ext::gnss_position :definition-)
      "# A global position measurement from a GNSS sensor.

bool fix_3d                 # Indicates if the fix is 3-dimensional (includes altitude/separation).

float64 latitude            # Degrees latitude (positive = N, negative = S)
float64 longitude           # Degrees longitude (positive = E, negative = W)
float32 altitude            # Orthometric altitude above geoid/MSL [m]
float32 separation          # Geoid separation above the ellipsoid [m]
")



(provide :sensor_msgs_ext/gnss_position "8a8ab81d639b92d4341ee22e49a250a5")


