; Auto-generated. Do not edit!


(cl:in-package sensor_msgs_ext-msg)


;//! \htmlinclude analog_voltage.msg.html

(cl:defclass <analog_voltage> (roslisp-msg-protocol:ros-message)
  ((voltage
    :reader voltage
    :initarg :voltage
    :type cl:float
    :initform 0.0))
)

(cl:defclass analog_voltage (<analog_voltage>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <analog_voltage>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'analog_voltage)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name sensor_msgs_ext-msg:<analog_voltage> is deprecated: use sensor_msgs_ext-msg:analog_voltage instead.")))

(cl:ensure-generic-function 'voltage-val :lambda-list '(m))
(cl:defmethod voltage-val ((m <analog_voltage>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader sensor_msgs_ext-msg:voltage-val is deprecated.  Use sensor_msgs_ext-msg:voltage instead.")
  (voltage m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <analog_voltage>) ostream)
  "Serializes a message object of type '<analog_voltage>"
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'voltage))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <analog_voltage>) istream)
  "Deserializes a message object of type '<analog_voltage>"
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'voltage) (roslisp-utils:decode-double-float-bits bits)))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<analog_voltage>)))
  "Returns string type for a message object of type '<analog_voltage>"
  "sensor_msgs_ext/analog_voltage")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'analog_voltage)))
  "Returns string type for a message object of type 'analog_voltage"
  "sensor_msgs_ext/analog_voltage")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<analog_voltage>)))
  "Returns md5sum for a message object of type '<analog_voltage>"
  "cd1e97d74e6d797b46bc5a51e820e6ae")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'analog_voltage)))
  "Returns md5sum for a message object of type 'analog_voltage"
  "cd1e97d74e6d797b46bc5a51e820e6ae")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<analog_voltage>)))
  "Returns full string definition for message of type '<analog_voltage>"
  (cl:format cl:nil "# Reports an analog voltage measurements.~%~%float64 voltage     # The measured analog voltage [v]~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'analog_voltage)))
  "Returns full string definition for message of type 'analog_voltage"
  (cl:format cl:nil "# Reports an analog voltage measurements.~%~%float64 voltage     # The measured analog voltage [v]~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <analog_voltage>))
  (cl:+ 0
     8
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <analog_voltage>))
  "Converts a ROS message object to a list"
  (cl:list 'analog_voltage
    (cl:cons ':voltage (voltage msg))
))
