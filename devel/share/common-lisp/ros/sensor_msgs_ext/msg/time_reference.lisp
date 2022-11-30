; Auto-generated. Do not edit!


(cl:in-package sensor_msgs_ext-msg)


;//! \htmlinclude time_reference.msg.html

(cl:defclass <time_reference> (roslisp-msg-protocol:ros-message)
  ((utc_time
    :reader utc_time
    :initarg :utc_time
    :type cl:real
    :initform 0))
)

(cl:defclass time_reference (<time_reference>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <time_reference>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'time_reference)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name sensor_msgs_ext-msg:<time_reference> is deprecated: use sensor_msgs_ext-msg:time_reference instead.")))

(cl:ensure-generic-function 'utc_time-val :lambda-list '(m))
(cl:defmethod utc_time-val ((m <time_reference>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader sensor_msgs_ext-msg:utc_time-val is deprecated.  Use sensor_msgs_ext-msg:utc_time instead.")
  (utc_time m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <time_reference>) ostream)
  "Serializes a message object of type '<time_reference>"
  (cl:let ((__sec (cl:floor (cl:slot-value msg 'utc_time)))
        (__nsec (cl:round (cl:* 1e9 (cl:- (cl:slot-value msg 'utc_time) (cl:floor (cl:slot-value msg 'utc_time)))))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __sec) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __sec) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __sec) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __sec) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 0) __nsec) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __nsec) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __nsec) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __nsec) ostream))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <time_reference>) istream)
  "Deserializes a message object of type '<time_reference>"
    (cl:let ((__sec 0) (__nsec 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __sec) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __sec) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __sec) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __sec) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 0) __nsec) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __nsec) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __nsec) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __nsec) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'utc_time) (cl:+ (cl:coerce __sec 'cl:double-float) (cl:/ __nsec 1e9))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<time_reference>)))
  "Returns string type for a message object of type '<time_reference>"
  "sensor_msgs_ext/time_reference")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'time_reference)))
  "Returns string type for a message object of type 'time_reference"
  "sensor_msgs_ext/time_reference")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<time_reference>)))
  "Returns md5sum for a message object of type '<time_reference>"
  "3fec41e35208cc454786888579a04bcb")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'time_reference)))
  "Returns md5sum for a message object of type 'time_reference"
  "3fec41e35208cc454786888579a04bcb")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<time_reference>)))
  "Returns full string definition for message of type '<time_reference>"
  (cl:format cl:nil "# A time measurement from a timing source.~%~%time utc_time       # The measured UTC time.~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'time_reference)))
  "Returns full string definition for message of type 'time_reference"
  (cl:format cl:nil "# A time measurement from a timing source.~%~%time utc_time       # The measured UTC time.~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <time_reference>))
  (cl:+ 0
     8
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <time_reference>))
  "Converts a ROS message object to a list"
  (cl:list 'time_reference
    (cl:cons ':utc_time (utc_time msg))
))
