
(cl:in-package :asdf)

(defsystem "sensor_msgs_ext-srv"
  :depends-on (:roslisp-msg-protocol :roslisp-utils )
  :components ((:file "_package")
    (:file "calibrate_gyroscope" :depends-on ("_package_calibrate_gyroscope"))
    (:file "_package_calibrate_gyroscope" :depends-on ("_package"))
    (:file "get_proximity_configuration" :depends-on ("_package_get_proximity_configuration"))
    (:file "_package_get_proximity_configuration" :depends-on ("_package"))
    (:file "set_axis_home" :depends-on ("_package_set_axis_home"))
    (:file "_package_set_axis_home" :depends-on ("_package"))
  ))