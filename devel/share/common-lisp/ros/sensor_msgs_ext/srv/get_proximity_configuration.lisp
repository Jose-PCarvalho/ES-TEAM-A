; Auto-generated. Do not edit!


(cl:in-package sensor_msgs_ext-srv)


;//! \htmlinclude get_proximity_configuration-request.msg.html

(cl:defclass <get_proximity_configuration-request> (roslisp-msg-protocol:ros-message)
  ()
)

(cl:defclass get_proximity_configuration-request (<get_proximity_configuration-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <get_proximity_configuration-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'get_proximity_configuration-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name sensor_msgs_ext-srv:<get_proximity_configuration-request> is deprecated: use sensor_msgs_ext-srv:get_proximity_configuration-request instead.")))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <get_proximity_configuration-request>) ostream)
  "Serializes a message object of type '<get_proximity_configuration-request>"
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <get_proximity_configuration-request>) istream)
  "Deserializes a message object of type '<get_proximity_configuration-request>"
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<get_proximity_configuration-request>)))
  "Returns string type for a service object of type '<get_proximity_configuration-request>"
  "sensor_msgs_ext/get_proximity_configurationRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'get_proximity_configuration-request)))
  "Returns string type for a service object of type 'get_proximity_configuration-request"
  "sensor_msgs_ext/get_proximity_configurationRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<get_proximity_configuration-request>)))
  "Returns md5sum for a message object of type '<get_proximity_configuration-request>"
  "bc6aa8c1ba0744c7248467a89aa5b3e1")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'get_proximity_configuration-request)))
  "Returns md5sum for a message object of type 'get_proximity_configuration-request"
  "bc6aa8c1ba0744c7248467a89aa5b3e1")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<get_proximity_configuration-request>)))
  "Returns full string definition for message of type '<get_proximity_configuration-request>"
  (cl:format cl:nil "# Retrieves the configuration of a proximity sensor.~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'get_proximity_configuration-request)))
  "Returns full string definition for message of type 'get_proximity_configuration-request"
  (cl:format cl:nil "# Retrieves the configuration of a proximity sensor.~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <get_proximity_configuration-request>))
  (cl:+ 0
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <get_proximity_configuration-request>))
  "Converts a ROS message object to a list"
  (cl:list 'get_proximity_configuration-request
))
;//! \htmlinclude get_proximity_configuration-response.msg.html

(cl:defclass <get_proximity_configuration-response> (roslisp-msg-protocol:ros-message)
  ((radiation_type
    :reader radiation_type
    :initarg :radiation_type
    :type cl:fixnum
    :initform 0)
   (min_range
    :reader min_range
    :initarg :min_range
    :type cl:float
    :initform 0.0)
   (max_range
    :reader max_range
    :initarg :max_range
    :type cl:float
    :initform 0.0)
   (field_of_view
    :reader field_of_view
    :initarg :field_of_view
    :type cl:float
    :initform 0.0))
)

(cl:defclass get_proximity_configuration-response (<get_proximity_configuration-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <get_proximity_configuration-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'get_proximity_configuration-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name sensor_msgs_ext-srv:<get_proximity_configuration-response> is deprecated: use sensor_msgs_ext-srv:get_proximity_configuration-response instead.")))

(cl:ensure-generic-function 'radiation_type-val :lambda-list '(m))
(cl:defmethod radiation_type-val ((m <get_proximity_configuration-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader sensor_msgs_ext-srv:radiation_type-val is deprecated.  Use sensor_msgs_ext-srv:radiation_type instead.")
  (radiation_type m))

(cl:ensure-generic-function 'min_range-val :lambda-list '(m))
(cl:defmethod min_range-val ((m <get_proximity_configuration-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader sensor_msgs_ext-srv:min_range-val is deprecated.  Use sensor_msgs_ext-srv:min_range instead.")
  (min_range m))

(cl:ensure-generic-function 'max_range-val :lambda-list '(m))
(cl:defmethod max_range-val ((m <get_proximity_configuration-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader sensor_msgs_ext-srv:max_range-val is deprecated.  Use sensor_msgs_ext-srv:max_range instead.")
  (max_range m))

(cl:ensure-generic-function 'field_of_view-val :lambda-list '(m))
(cl:defmethod field_of_view-val ((m <get_proximity_configuration-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader sensor_msgs_ext-srv:field_of_view-val is deprecated.  Use sensor_msgs_ext-srv:field_of_view instead.")
  (field_of_view m))
(cl:defmethod roslisp-msg-protocol:symbol-codes ((msg-type (cl:eql '<get_proximity_configuration-response>)))
    "Constants for message type '<get_proximity_configuration-response>"
  '((:RADIATION_TYPE_UNSPECIFIED . 255)
    (:RADIATION_TYPE_ULTRASOUND . 0)
    (:RADIATION_TYPE_INFRARED . 1)
    (:RADIATION_TYPE_RADAR . 2))
)
(cl:defmethod roslisp-msg-protocol:symbol-codes ((msg-type (cl:eql 'get_proximity_configuration-response)))
    "Constants for message type 'get_proximity_configuration-response"
  '((:RADIATION_TYPE_UNSPECIFIED . 255)
    (:RADIATION_TYPE_ULTRASOUND . 0)
    (:RADIATION_TYPE_INFRARED . 1)
    (:RADIATION_TYPE_RADAR . 2))
)
(cl:defmethod roslisp-msg-protocol:serialize ((msg <get_proximity_configuration-response>) ostream)
  "Serializes a message object of type '<get_proximity_configuration-response>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'radiation_type)) ostream)
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'min_range))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'max_range))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'field_of_view))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <get_proximity_configuration-response>) istream)
  "Deserializes a message object of type '<get_proximity_configuration-response>"
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'radiation_type)) (cl:read-byte istream))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'min_range) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'max_range) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'field_of_view) (roslisp-utils:decode-single-float-bits bits)))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<get_proximity_configuration-response>)))
  "Returns string type for a service object of type '<get_proximity_configuration-response>"
  "sensor_msgs_ext/get_proximity_configurationResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'get_proximity_configuration-response)))
  "Returns string type for a service object of type 'get_proximity_configuration-response"
  "sensor_msgs_ext/get_proximity_configurationResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<get_proximity_configuration-response>)))
  "Returns md5sum for a message object of type '<get_proximity_configuration-response>"
  "bc6aa8c1ba0744c7248467a89aa5b3e1")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'get_proximity_configuration-response)))
  "Returns md5sum for a message object of type 'get_proximity_configuration-response"
  "bc6aa8c1ba0744c7248467a89aa5b3e1")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<get_proximity_configuration-response>)))
  "Returns full string definition for message of type '<get_proximity_configuration-response>"
  (cl:format cl:nil "uint8 radiation_type                    # The type of radiation used by the sensor.~%uint8 RADIATION_TYPE_UNSPECIFIED=255~%uint8 RADIATION_TYPE_ULTRASOUND=0~%uint8 RADIATION_TYPE_INFRARED=1~%uint8 RADIATION_TYPE_RADAR=2~%~%float32 min_range                       # The minimum detection range of the sensor [m]~%float32 max_range                       # The maximum detection range of the sensor [m]~%~%float32 field_of_view                   # The maximum FoV of the sensor [rad]~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'get_proximity_configuration-response)))
  "Returns full string definition for message of type 'get_proximity_configuration-response"
  (cl:format cl:nil "uint8 radiation_type                    # The type of radiation used by the sensor.~%uint8 RADIATION_TYPE_UNSPECIFIED=255~%uint8 RADIATION_TYPE_ULTRASOUND=0~%uint8 RADIATION_TYPE_INFRARED=1~%uint8 RADIATION_TYPE_RADAR=2~%~%float32 min_range                       # The minimum detection range of the sensor [m]~%float32 max_range                       # The maximum detection range of the sensor [m]~%~%float32 field_of_view                   # The maximum FoV of the sensor [rad]~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <get_proximity_configuration-response>))
  (cl:+ 0
     1
     4
     4
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <get_proximity_configuration-response>))
  "Converts a ROS message object to a list"
  (cl:list 'get_proximity_configuration-response
    (cl:cons ':radiation_type (radiation_type msg))
    (cl:cons ':min_range (min_range msg))
    (cl:cons ':max_range (max_range msg))
    (cl:cons ':field_of_view (field_of_view msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'get_proximity_configuration)))
  'get_proximity_configuration-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'get_proximity_configuration)))
  'get_proximity_configuration-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'get_proximity_configuration)))
  "Returns string type for a service object of type '<get_proximity_configuration>"
  "sensor_msgs_ext/get_proximity_configuration")