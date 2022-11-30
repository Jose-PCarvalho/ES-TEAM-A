;; Auto-generated. Do not edit!


(when (boundp 'sensor_msgs_ext::gnss_fix)
  (if (not (find-package "SENSOR_MSGS_EXT"))
    (make-package "SENSOR_MSGS_EXT"))
  (shadow 'gnss_fix (find-package "SENSOR_MSGS_EXT")))
(unless (find-package "SENSOR_MSGS_EXT::GNSS_FIX")
  (make-package "SENSOR_MSGS_EXT::GNSS_FIX"))

(in-package "ROS")
;;//! \htmlinclude gnss_fix.msg.html


(intern "*TYPE_NO_FIX*" (find-package "SENSOR_MSGS_EXT::GNSS_FIX"))
(shadow '*TYPE_NO_FIX* (find-package "SENSOR_MSGS_EXT::GNSS_FIX"))
(defconstant sensor_msgs_ext::gnss_fix::*TYPE_NO_FIX* 0)
(intern "*TYPE_FIX*" (find-package "SENSOR_MSGS_EXT::GNSS_FIX"))
(shadow '*TYPE_FIX* (find-package "SENSOR_MSGS_EXT::GNSS_FIX"))
(defconstant sensor_msgs_ext::gnss_fix::*TYPE_FIX* 1)
(intern "*TYPE_DIFFERENTIAL*" (find-package "SENSOR_MSGS_EXT::GNSS_FIX"))
(shadow '*TYPE_DIFFERENTIAL* (find-package "SENSOR_MSGS_EXT::GNSS_FIX"))
(defconstant sensor_msgs_ext::gnss_fix::*TYPE_DIFFERENTIAL* 2)
(intern "*TYPE_RTK_FIXED*" (find-package "SENSOR_MSGS_EXT::GNSS_FIX"))
(shadow '*TYPE_RTK_FIXED* (find-package "SENSOR_MSGS_EXT::GNSS_FIX"))
(defconstant sensor_msgs_ext::gnss_fix::*TYPE_RTK_FIXED* 4)
(intern "*TYPE_RTK_FLOAT*" (find-package "SENSOR_MSGS_EXT::GNSS_FIX"))
(shadow '*TYPE_RTK_FLOAT* (find-package "SENSOR_MSGS_EXT::GNSS_FIX"))
(defconstant sensor_msgs_ext::gnss_fix::*TYPE_RTK_FLOAT* 5)
(intern "*TYPE_DEAD_RECKONING*" (find-package "SENSOR_MSGS_EXT::GNSS_FIX"))
(shadow '*TYPE_DEAD_RECKONING* (find-package "SENSOR_MSGS_EXT::GNSS_FIX"))
(defconstant sensor_msgs_ext::gnss_fix::*TYPE_DEAD_RECKONING* 6)
(intern "*MODE_SELECTION_MANUAL*" (find-package "SENSOR_MSGS_EXT::GNSS_FIX"))
(shadow '*MODE_SELECTION_MANUAL* (find-package "SENSOR_MSGS_EXT::GNSS_FIX"))
(defconstant sensor_msgs_ext::gnss_fix::*MODE_SELECTION_MANUAL* 0)
(intern "*MODE_SELECTION_AUTOMATIC*" (find-package "SENSOR_MSGS_EXT::GNSS_FIX"))
(shadow '*MODE_SELECTION_AUTOMATIC* (find-package "SENSOR_MSGS_EXT::GNSS_FIX"))
(defconstant sensor_msgs_ext::gnss_fix::*MODE_SELECTION_AUTOMATIC* 1)
(intern "*MODE_NONE*" (find-package "SENSOR_MSGS_EXT::GNSS_FIX"))
(shadow '*MODE_NONE* (find-package "SENSOR_MSGS_EXT::GNSS_FIX"))
(defconstant sensor_msgs_ext::gnss_fix::*MODE_NONE* 0)
(intern "*MODE_2D*" (find-package "SENSOR_MSGS_EXT::GNSS_FIX"))
(shadow '*MODE_2D* (find-package "SENSOR_MSGS_EXT::GNSS_FIX"))
(defconstant sensor_msgs_ext::gnss_fix::*MODE_2D* 1)
(intern "*MODE_3D*" (find-package "SENSOR_MSGS_EXT::GNSS_FIX"))
(shadow '*MODE_3D* (find-package "SENSOR_MSGS_EXT::GNSS_FIX"))
(defconstant sensor_msgs_ext::gnss_fix::*MODE_3D* 2)

(defun sensor_msgs_ext::gnss_fix-to-symbol (const)
  (cond
        ((= const 0) 'sensor_msgs_ext::gnss_fix::*TYPE_NO_FIX*)
        ((= const 1) 'sensor_msgs_ext::gnss_fix::*TYPE_FIX*)
        ((= const 2) 'sensor_msgs_ext::gnss_fix::*TYPE_DIFFERENTIAL*)
        ((= const 4) 'sensor_msgs_ext::gnss_fix::*TYPE_RTK_FIXED*)
        ((= const 5) 'sensor_msgs_ext::gnss_fix::*TYPE_RTK_FLOAT*)
        ((= const 6) 'sensor_msgs_ext::gnss_fix::*TYPE_DEAD_RECKONING*)
        ((= const 0) 'sensor_msgs_ext::gnss_fix::*MODE_SELECTION_MANUAL*)
        ((= const 1) 'sensor_msgs_ext::gnss_fix::*MODE_SELECTION_AUTOMATIC*)
        ((= const 0) 'sensor_msgs_ext::gnss_fix::*MODE_NONE*)
        ((= const 1) 'sensor_msgs_ext::gnss_fix::*MODE_2D*)
        ((= const 2) 'sensor_msgs_ext::gnss_fix::*MODE_3D*)
        (t nil)))

(defclass sensor_msgs_ext::gnss_fix
  :super ros::object
  :slots (_type _mode_selection _mode _satellite_count ))

(defmethod sensor_msgs_ext::gnss_fix
  (:init
   (&key
    ((:type __type) 0)
    ((:mode_selection __mode_selection) 0)
    ((:mode __mode) 0)
    ((:satellite_count __satellite_count) 0)
    )
   (send-super :init)
   (setq _type (round __type))
   (setq _mode_selection (round __mode_selection))
   (setq _mode (round __mode))
   (setq _satellite_count (round __satellite_count))
   self)
  (:type
   (&optional __type)
   (if __type (setq _type __type)) _type)
  (:mode_selection
   (&optional __mode_selection)
   (if __mode_selection (setq _mode_selection __mode_selection)) _mode_selection)
  (:mode
   (&optional __mode)
   (if __mode (setq _mode __mode)) _mode)
  (:satellite_count
   (&optional __satellite_count)
   (if __satellite_count (setq _satellite_count __satellite_count)) _satellite_count)
  (:serialization-length
   ()
   (+
    ;; uint8 _type
    1
    ;; uint8 _mode_selection
    1
    ;; uint8 _mode
    1
    ;; uint8 _satellite_count
    1
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; uint8 _type
       (write-byte _type s)
     ;; uint8 _mode_selection
       (write-byte _mode_selection s)
     ;; uint8 _mode
       (write-byte _mode s)
     ;; uint8 _satellite_count
       (write-byte _satellite_count s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; uint8 _type
     (setq _type (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; uint8 _mode_selection
     (setq _mode_selection (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; uint8 _mode
     (setq _mode (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; uint8 _satellite_count
     (setq _satellite_count (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;;
   self)
  )

(setf (get sensor_msgs_ext::gnss_fix :md5sum-) "ac20d1087808fbd5ae6cee3e0e0bee4d")
(setf (get sensor_msgs_ext::gnss_fix :datatype-) "sensor_msgs_ext/gnss_fix")
(setf (get sensor_msgs_ext::gnss_fix :definition-)
      "# Describes the status of a GNSS receiver's fix.

uint8 type                            # The current fix type.
uint8 TYPE_NO_FIX = 0
uint8 TYPE_FIX = 1
uint8 TYPE_DIFFERENTIAL = 2
uint8 TYPE_RTK_FIXED = 4
uint8 TYPE_RTK_FLOAT = 5
uint8 TYPE_DEAD_RECKONING = 6

uint8 mode_selection                  # The selection type for the operating mode.
uint8 MODE_SELECTION_MANUAL = 0
uint8 MODE_SELECTION_AUTOMATIC = 1

uint8 mode                            # The current operating mode.
uint8 MODE_NONE = 0
uint8 MODE_2D = 1
uint8 MODE_3D = 2

uint8 satellite_count                 # The number of satellites used in the fix solution.
")



(provide :sensor_msgs_ext/gnss_fix "ac20d1087808fbd5ae6cee3e0e0bee4d")


