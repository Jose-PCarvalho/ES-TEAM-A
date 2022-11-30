; Auto-generated. Do not edit!


(cl:in-package sensor_msgs_ext-msg)


;//! \htmlinclude gnss_position.msg.html

(cl:defclass <gnss_position> (roslisp-msg-protocol:ros-message)
  ((fix_3d
    :reader fix_3d
    :initarg :fix_3d
    :type cl:boolean
    :initform cl:nil)
   (latitude
    :reader latitude
    :initarg :latitude
    :type cl:float
    :initform 0.0)
   (longitude
    :reader longitude
    :initarg :longitude
    :type cl:float
    :initform 0.0)
   (altitude
    :reader altitude
    :initarg :altitude
    :type cl:float
    :initform 0.0)
   (separation
    :reader separation
    :initarg :separation
    :type cl:float
    :initform 0.0))
)

(cl:defclass gnss_position (<gnss_position>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <gnss_position>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'gnss_position)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name sensor_msgs_ext-msg:<gnss_position> is deprecated: use sensor_msgs_ext-msg:gnss_position instead.")))

(cl:ensure-generic-function 'fix_3d-val :lambda-list '(m))
(cl:defmethod fix_3d-val ((m <gnss_position>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader sensor_msgs_ext-msg:fix_3d-val is deprecated.  Use sensor_msgs_ext-msg:fix_3d instead.")
  (fix_3d m))

(cl:ensure-generic-function 'latitude-val :lambda-list '(m))
(cl:defmethod latitude-val ((m <gnss_position>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader sensor_msgs_ext-msg:latitude-val is deprecated.  Use sensor_msgs_ext-msg:latitude instead.")
  (latitude m))

(cl:ensure-generic-function 'longitude-val :lambda-list '(m))
(cl:defmethod longitude-val ((m <gnss_position>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader sensor_msgs_ext-msg:longitude-val is deprecated.  Use sensor_msgs_ext-msg:longitude instead.")
  (longitude m))

(cl:ensure-generic-function 'altitude-val :lambda-list '(m))
(cl:defmethod altitude-val ((m <gnss_position>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader sensor_msgs_ext-msg:altitude-val is deprecated.  Use sensor_msgs_ext-msg:altitude instead.")
  (altitude m))

(cl:ensure-generic-function 'separation-val :lambda-list '(m))
(cl:defmethod separation-val ((m <gnss_position>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader sensor_msgs_ext-msg:separation-val is deprecated.  Use sensor_msgs_ext-msg:separation instead.")
  (separation m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <gnss_position>) ostream)
  "Serializes a message object of type '<gnss_position>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'fix_3d) 1 0)) ostream)
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'latitude))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'longitude))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'altitude))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'separation))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <gnss_position>) istream)
  "Deserializes a message object of type '<gnss_position>"
    (cl:setf (cl:slot-value msg 'fix_3d) (cl:not (cl:zerop (cl:read-byte istream))))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'latitude) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'longitude) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'altitude) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'separation) (roslisp-utils:decode-single-float-bits bits)))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<gnss_position>)))
  "Returns string type for a message object of type '<gnss_position>"
  "sensor_msgs_ext/gnss_position")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'gnss_position)))
  "Returns string type for a message object of type 'gnss_position"
  "sensor_msgs_ext/gnss_position")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<gnss_position>)))
  "Returns md5sum for a message object of type '<gnss_position>"
  "8a8ab81d639b92d4341ee22e49a250a5")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'gnss_position)))
  "Returns md5sum for a message object of type 'gnss_position"
  "8a8ab81d639b92d4341ee22e49a250a5")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<gnss_position>)))
  "Returns full string definition for message of type '<gnss_position>"
  (cl:format cl:nil "# A global position measurement from a GNSS sensor.~%~%bool fix_3d                 # Indicates if the fix is 3-dimensional (includes altitude/separation).~%~%float64 latitude            # Degrees latitude (positive = N, negative = S)~%float64 longitude           # Degrees longitude (positive = E, negative = W)~%float32 altitude            # Orthometric altitude above geoid/MSL [m]~%float32 separation          # Geoid separation above the ellipsoid [m]~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'gnss_position)))
  "Returns full string definition for message of type 'gnss_position"
  (cl:format cl:nil "# A global position measurement from a GNSS sensor.~%~%bool fix_3d                 # Indicates if the fix is 3-dimensional (includes altitude/separation).~%~%float64 latitude            # Degrees latitude (positive = N, negative = S)~%float64 longitude           # Degrees longitude (positive = E, negative = W)~%float32 altitude            # Orthometric altitude above geoid/MSL [m]~%float32 separation          # Geoid separation above the ellipsoid [m]~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <gnss_position>))
  (cl:+ 0
     1
     8
     8
     4
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <gnss_position>))
  "Converts a ROS message object to a list"
  (cl:list 'gnss_position
    (cl:cons ':fix_3d (fix_3d msg))
    (cl:cons ':latitude (latitude msg))
    (cl:cons ':longitude (longitude msg))
    (cl:cons ':altitude (altitude msg))
    (cl:cons ':separation (separation msg))
))
