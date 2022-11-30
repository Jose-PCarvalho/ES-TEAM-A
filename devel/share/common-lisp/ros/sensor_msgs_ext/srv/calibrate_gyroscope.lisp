; Auto-generated. Do not edit!


(cl:in-package sensor_msgs_ext-srv)


;//! \htmlinclude calibrate_gyroscope-request.msg.html

(cl:defclass <calibrate_gyroscope-request> (roslisp-msg-protocol:ros-message)
  ((averaging_period
    :reader averaging_period
    :initarg :averaging_period
    :type cl:integer
    :initform 0))
)

(cl:defclass calibrate_gyroscope-request (<calibrate_gyroscope-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <calibrate_gyroscope-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'calibrate_gyroscope-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name sensor_msgs_ext-srv:<calibrate_gyroscope-request> is deprecated: use sensor_msgs_ext-srv:calibrate_gyroscope-request instead.")))

(cl:ensure-generic-function 'averaging_period-val :lambda-list '(m))
(cl:defmethod averaging_period-val ((m <calibrate_gyroscope-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader sensor_msgs_ext-srv:averaging_period-val is deprecated.  Use sensor_msgs_ext-srv:averaging_period instead.")
  (averaging_period m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <calibrate_gyroscope-request>) ostream)
  "Serializes a message object of type '<calibrate_gyroscope-request>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'averaging_period)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'averaging_period)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 16) (cl:slot-value msg 'averaging_period)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 24) (cl:slot-value msg 'averaging_period)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <calibrate_gyroscope-request>) istream)
  "Deserializes a message object of type '<calibrate_gyroscope-request>"
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'averaging_period)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'averaging_period)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) (cl:slot-value msg 'averaging_period)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) (cl:slot-value msg 'averaging_period)) (cl:read-byte istream))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<calibrate_gyroscope-request>)))
  "Returns string type for a service object of type '<calibrate_gyroscope-request>"
  "sensor_msgs_ext/calibrate_gyroscopeRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'calibrate_gyroscope-request)))
  "Returns string type for a service object of type 'calibrate_gyroscope-request"
  "sensor_msgs_ext/calibrate_gyroscopeRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<calibrate_gyroscope-request>)))
  "Returns md5sum for a message object of type '<calibrate_gyroscope-request>"
  "769e1036bf83679c0a4a88609626cccf")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'calibrate_gyroscope-request)))
  "Returns md5sum for a message object of type 'calibrate_gyroscope-request"
  "769e1036bf83679c0a4a88609626cccf")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<calibrate_gyroscope-request>)))
  "Returns full string definition for message of type '<calibrate_gyroscope-request>"
  (cl:format cl:nil "# Requests a zero-velocity calibration of a gyroscope.~%~%uint32 averaging_period     # The number of milliseconds to average the bias calculation over.~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'calibrate_gyroscope-request)))
  "Returns full string definition for message of type 'calibrate_gyroscope-request"
  (cl:format cl:nil "# Requests a zero-velocity calibration of a gyroscope.~%~%uint32 averaging_period     # The number of milliseconds to average the bias calculation over.~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <calibrate_gyroscope-request>))
  (cl:+ 0
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <calibrate_gyroscope-request>))
  "Converts a ROS message object to a list"
  (cl:list 'calibrate_gyroscope-request
    (cl:cons ':averaging_period (averaging_period msg))
))
;//! \htmlinclude calibrate_gyroscope-response.msg.html

(cl:defclass <calibrate_gyroscope-response> (roslisp-msg-protocol:ros-message)
  ((success
    :reader success
    :initarg :success
    :type cl:boolean
    :initform cl:nil)
   (message
    :reader message
    :initarg :message
    :type cl:string
    :initform ""))
)

(cl:defclass calibrate_gyroscope-response (<calibrate_gyroscope-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <calibrate_gyroscope-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'calibrate_gyroscope-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name sensor_msgs_ext-srv:<calibrate_gyroscope-response> is deprecated: use sensor_msgs_ext-srv:calibrate_gyroscope-response instead.")))

(cl:ensure-generic-function 'success-val :lambda-list '(m))
(cl:defmethod success-val ((m <calibrate_gyroscope-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader sensor_msgs_ext-srv:success-val is deprecated.  Use sensor_msgs_ext-srv:success instead.")
  (success m))

(cl:ensure-generic-function 'message-val :lambda-list '(m))
(cl:defmethod message-val ((m <calibrate_gyroscope-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader sensor_msgs_ext-srv:message-val is deprecated.  Use sensor_msgs_ext-srv:message instead.")
  (message m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <calibrate_gyroscope-response>) ostream)
  "Serializes a message object of type '<calibrate_gyroscope-response>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'success) 1 0)) ostream)
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'message))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'message))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <calibrate_gyroscope-response>) istream)
  "Deserializes a message object of type '<calibrate_gyroscope-response>"
    (cl:setf (cl:slot-value msg 'success) (cl:not (cl:zerop (cl:read-byte istream))))
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'message) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'message) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<calibrate_gyroscope-response>)))
  "Returns string type for a service object of type '<calibrate_gyroscope-response>"
  "sensor_msgs_ext/calibrate_gyroscopeResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'calibrate_gyroscope-response)))
  "Returns string type for a service object of type 'calibrate_gyroscope-response"
  "sensor_msgs_ext/calibrate_gyroscopeResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<calibrate_gyroscope-response>)))
  "Returns md5sum for a message object of type '<calibrate_gyroscope-response>"
  "769e1036bf83679c0a4a88609626cccf")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'calibrate_gyroscope-response)))
  "Returns md5sum for a message object of type 'calibrate_gyroscope-response"
  "769e1036bf83679c0a4a88609626cccf")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<calibrate_gyroscope-response>)))
  "Returns full string definition for message of type '<calibrate_gyroscope-response>"
  (cl:format cl:nil "bool success                # TRUE if the calibration was successful, otherwise FALSE.~%string message              # If unsuccesful, reports the reason.~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'calibrate_gyroscope-response)))
  "Returns full string definition for message of type 'calibrate_gyroscope-response"
  (cl:format cl:nil "bool success                # TRUE if the calibration was successful, otherwise FALSE.~%string message              # If unsuccesful, reports the reason.~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <calibrate_gyroscope-response>))
  (cl:+ 0
     1
     4 (cl:length (cl:slot-value msg 'message))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <calibrate_gyroscope-response>))
  "Converts a ROS message object to a list"
  (cl:list 'calibrate_gyroscope-response
    (cl:cons ':success (success msg))
    (cl:cons ':message (message msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'calibrate_gyroscope)))
  'calibrate_gyroscope-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'calibrate_gyroscope)))
  'calibrate_gyroscope-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'calibrate_gyroscope)))
  "Returns string type for a service object of type '<calibrate_gyroscope>"
  "sensor_msgs_ext/calibrate_gyroscope")