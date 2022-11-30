;; Auto-generated. Do not edit!


(when (boundp 'sensor_msgs_ext::axis_state)
  (if (not (find-package "SENSOR_MSGS_EXT"))
    (make-package "SENSOR_MSGS_EXT"))
  (shadow 'axis_state (find-package "SENSOR_MSGS_EXT")))
(unless (find-package "SENSOR_MSGS_EXT::AXIS_STATE")
  (make-package "SENSOR_MSGS_EXT::AXIS_STATE"))

(in-package "ROS")
;;//! \htmlinclude axis_state.msg.html


(defclass sensor_msgs_ext::axis_state
  :super ros::object
  :slots (_position _velocity _acceleration ))

(defmethod sensor_msgs_ext::axis_state
  (:init
   (&key
    ((:position __position) 0.0)
    ((:velocity __velocity) 0.0)
    ((:acceleration __acceleration) 0.0)
    )
   (send-super :init)
   (setq _position (float __position))
   (setq _velocity (float __velocity))
   (setq _acceleration (float __acceleration))
   self)
  (:position
   (&optional __position)
   (if __position (setq _position __position)) _position)
  (:velocity
   (&optional __velocity)
   (if __velocity (setq _velocity __velocity)) _velocity)
  (:acceleration
   (&optional __acceleration)
   (if __acceleration (setq _acceleration __acceleration)) _acceleration)
  (:serialization-length
   ()
   (+
    ;; float64 _position
    8
    ;; float64 _velocity
    8
    ;; float64 _acceleration
    8
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; float64 _position
       (sys::poke _position (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _velocity
       (sys::poke _velocity (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _acceleration
       (sys::poke _acceleration (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; float64 _position
     (setq _position (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _velocity
     (setq _velocity (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _acceleration
     (setq _acceleration (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;;
   self)
  )

(setf (get sensor_msgs_ext::axis_state :md5sum-) "fac91d40217087ed5dbc79c40ec194e4")
(setf (get sensor_msgs_ext::axis_state :datatype-) "sensor_msgs_ext/axis_state")
(setf (get sensor_msgs_ext::axis_state :definition-)
      "# Reports the instantaneous state of an axis.

float64 position            # The current position of the axis [rad]
float64 velocity            # The current velocity of the axis [rad/s]
float64 acceleration        # The current acceleration of the axis [rad/s^2]
")



(provide :sensor_msgs_ext/axis_state "fac91d40217087ed5dbc79c40ec194e4")


