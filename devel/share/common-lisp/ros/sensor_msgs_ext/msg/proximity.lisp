; Auto-generated. Do not edit!


(cl:in-package sensor_msgs_ext-msg)


;//! \htmlinclude proximity.msg.html

(cl:defclass <proximity> (roslisp-msg-protocol:ros-message)
  ((proximity
    :reader proximity
    :initarg :proximity
    :type cl:boolean
    :initform cl:nil))
)

(cl:defclass proximity (<proximity>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <proximity>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'proximity)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name sensor_msgs_ext-msg:<proximity> is deprecated: use sensor_msgs_ext-msg:proximity instead.")))

(cl:ensure-generic-function 'proximity-val :lambda-list '(m))
(cl:defmethod proximity-val ((m <proximity>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader sensor_msgs_ext-msg:proximity-val is deprecated.  Use sensor_msgs_ext-msg:proximity instead.")
  (proximity m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <proximity>) ostream)
  "Serializes a message object of type '<proximity>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'proximity) 1 0)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <proximity>) istream)
  "Deserializes a message object of type '<proximity>"
    (cl:setf (cl:slot-value msg 'proximity) (cl:not (cl:zerop (cl:read-byte istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<proximity>)))
  "Returns string type for a message object of type '<proximity>"
  "sensor_msgs_ext/proximity")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'proximity)))
  "Returns string type for a message object of type 'proximity"
  "sensor_msgs_ext/proximity")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<proximity>)))
  "Returns md5sum for a message object of type '<proximity>"
  "87ce68baa8581bc2125ed1ea8e240a58")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'proximity)))
  "Returns md5sum for a message object of type 'proximity"
  "87ce68baa8581bc2125ed1ea8e240a58")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<proximity>)))
  "Returns full string definition for message of type '<proximity>"
  (cl:format cl:nil "# Reports the instantaneous measurement of a proximity sensor.~%~%bool proximity              # Reports TRUE if proximity is detected, otherwise FALSE.~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'proximity)))
  "Returns full string definition for message of type 'proximity"
  (cl:format cl:nil "# Reports the instantaneous measurement of a proximity sensor.~%~%bool proximity              # Reports TRUE if proximity is detected, otherwise FALSE.~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <proximity>))
  (cl:+ 0
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <proximity>))
  "Converts a ROS message object to a list"
  (cl:list 'proximity
    (cl:cons ':proximity (proximity msg))
))
