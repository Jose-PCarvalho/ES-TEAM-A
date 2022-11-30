; Auto-generated. Do not edit!


(cl:in-package sensor_msgs_ext-srv)


;//! \htmlinclude set_axis_home-request.msg.html

(cl:defclass <set_axis_home-request> (roslisp-msg-protocol:ros-message)
  ()
)

(cl:defclass set_axis_home-request (<set_axis_home-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <set_axis_home-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'set_axis_home-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name sensor_msgs_ext-srv:<set_axis_home-request> is deprecated: use sensor_msgs_ext-srv:set_axis_home-request instead.")))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <set_axis_home-request>) ostream)
  "Serializes a message object of type '<set_axis_home-request>"
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <set_axis_home-request>) istream)
  "Deserializes a message object of type '<set_axis_home-request>"
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<set_axis_home-request>)))
  "Returns string type for a service object of type '<set_axis_home-request>"
  "sensor_msgs_ext/set_axis_homeRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'set_axis_home-request)))
  "Returns string type for a service object of type 'set_axis_home-request"
  "sensor_msgs_ext/set_axis_homeRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<set_axis_home-request>)))
  "Returns md5sum for a message object of type '<set_axis_home-request>"
  "d41d8cd98f00b204e9800998ecf8427e")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'set_axis_home-request)))
  "Returns md5sum for a message object of type 'set_axis_home-request"
  "d41d8cd98f00b204e9800998ecf8427e")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<set_axis_home-request>)))
  "Returns full string definition for message of type '<set_axis_home-request>"
  (cl:format cl:nil "# Sets the home position of the axis to it's current position.~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'set_axis_home-request)))
  "Returns full string definition for message of type 'set_axis_home-request"
  (cl:format cl:nil "# Sets the home position of the axis to it's current position.~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <set_axis_home-request>))
  (cl:+ 0
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <set_axis_home-request>))
  "Converts a ROS message object to a list"
  (cl:list 'set_axis_home-request
))
;//! \htmlinclude set_axis_home-response.msg.html

(cl:defclass <set_axis_home-response> (roslisp-msg-protocol:ros-message)
  ()
)

(cl:defclass set_axis_home-response (<set_axis_home-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <set_axis_home-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'set_axis_home-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name sensor_msgs_ext-srv:<set_axis_home-response> is deprecated: use sensor_msgs_ext-srv:set_axis_home-response instead.")))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <set_axis_home-response>) ostream)
  "Serializes a message object of type '<set_axis_home-response>"
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <set_axis_home-response>) istream)
  "Deserializes a message object of type '<set_axis_home-response>"
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<set_axis_home-response>)))
  "Returns string type for a service object of type '<set_axis_home-response>"
  "sensor_msgs_ext/set_axis_homeResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'set_axis_home-response)))
  "Returns string type for a service object of type 'set_axis_home-response"
  "sensor_msgs_ext/set_axis_homeResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<set_axis_home-response>)))
  "Returns md5sum for a message object of type '<set_axis_home-response>"
  "d41d8cd98f00b204e9800998ecf8427e")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'set_axis_home-response)))
  "Returns md5sum for a message object of type 'set_axis_home-response"
  "d41d8cd98f00b204e9800998ecf8427e")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<set_axis_home-response>)))
  "Returns full string definition for message of type '<set_axis_home-response>"
  (cl:format cl:nil "~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'set_axis_home-response)))
  "Returns full string definition for message of type 'set_axis_home-response"
  (cl:format cl:nil "~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <set_axis_home-response>))
  (cl:+ 0
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <set_axis_home-response>))
  "Converts a ROS message object to a list"
  (cl:list 'set_axis_home-response
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'set_axis_home)))
  'set_axis_home-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'set_axis_home)))
  'set_axis_home-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'set_axis_home)))
  "Returns string type for a service object of type '<set_axis_home>"
  "sensor_msgs_ext/set_axis_home")