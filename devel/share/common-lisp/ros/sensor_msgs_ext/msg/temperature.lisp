; Auto-generated. Do not edit!


(cl:in-package sensor_msgs_ext-msg)


;//! \htmlinclude temperature.msg.html

(cl:defclass <temperature> (roslisp-msg-protocol:ros-message)
  ((temperature
    :reader temperature
    :initarg :temperature
    :type cl:float
    :initform 0.0))
)

(cl:defclass temperature (<temperature>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <temperature>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'temperature)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name sensor_msgs_ext-msg:<temperature> is deprecated: use sensor_msgs_ext-msg:temperature instead.")))

(cl:ensure-generic-function 'temperature-val :lambda-list '(m))
(cl:defmethod temperature-val ((m <temperature>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader sensor_msgs_ext-msg:temperature-val is deprecated.  Use sensor_msgs_ext-msg:temperature instead.")
  (temperature m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <temperature>) ostream)
  "Serializes a message object of type '<temperature>"
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'temperature))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <temperature>) istream)
  "Deserializes a message object of type '<temperature>"
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'temperature) (roslisp-utils:decode-double-float-bits bits)))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<temperature>)))
  "Returns string type for a message object of type '<temperature>"
  "sensor_msgs_ext/temperature")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'temperature)))
  "Returns string type for a message object of type 'temperature"
  "sensor_msgs_ext/temperature")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<temperature>)))
  "Returns md5sum for a message object of type '<temperature>"
  "3d36f909fc0be819c991c4abdee75a2b")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'temperature)))
  "Returns md5sum for a message object of type 'temperature"
  "3d36f909fc0be819c991c4abdee75a2b")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<temperature>)))
  "Returns full string definition for message of type '<temperature>"
  (cl:format cl:nil "# Indicates an instantaneous temperature reading.~%~%float64 temperature     # The measured temperature [C]~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'temperature)))
  "Returns full string definition for message of type 'temperature"
  (cl:format cl:nil "# Indicates an instantaneous temperature reading.~%~%float64 temperature     # The measured temperature [C]~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <temperature>))
  (cl:+ 0
     8
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <temperature>))
  "Converts a ROS message object to a list"
  (cl:list 'temperature
    (cl:cons ':temperature (temperature msg))
))
