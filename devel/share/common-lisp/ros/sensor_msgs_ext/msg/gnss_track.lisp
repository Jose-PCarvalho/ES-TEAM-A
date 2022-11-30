; Auto-generated. Do not edit!


(cl:in-package sensor_msgs_ext-msg)


;//! \htmlinclude gnss_track.msg.html

(cl:defclass <gnss_track> (roslisp-msg-protocol:ros-message)
  ((reference
    :reader reference
    :initarg :reference
    :type cl:fixnum
    :initform 0)
   (heading
    :reader heading
    :initarg :heading
    :type cl:float
    :initform 0.0)
   (speed
    :reader speed
    :initarg :speed
    :type cl:float
    :initform 0.0))
)

(cl:defclass gnss_track (<gnss_track>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <gnss_track>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'gnss_track)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name sensor_msgs_ext-msg:<gnss_track> is deprecated: use sensor_msgs_ext-msg:gnss_track instead.")))

(cl:ensure-generic-function 'reference-val :lambda-list '(m))
(cl:defmethod reference-val ((m <gnss_track>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader sensor_msgs_ext-msg:reference-val is deprecated.  Use sensor_msgs_ext-msg:reference instead.")
  (reference m))

(cl:ensure-generic-function 'heading-val :lambda-list '(m))
(cl:defmethod heading-val ((m <gnss_track>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader sensor_msgs_ext-msg:heading-val is deprecated.  Use sensor_msgs_ext-msg:heading instead.")
  (heading m))

(cl:ensure-generic-function 'speed-val :lambda-list '(m))
(cl:defmethod speed-val ((m <gnss_track>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader sensor_msgs_ext-msg:speed-val is deprecated.  Use sensor_msgs_ext-msg:speed instead.")
  (speed m))
(cl:defmethod roslisp-msg-protocol:symbol-codes ((msg-type (cl:eql '<gnss_track>)))
    "Constants for message type '<gnss_track>"
  '((:REFERENCE_TRUE_NORTH . 0)
    (:REFERENCE_MAGNETIC_NORTH . 1))
)
(cl:defmethod roslisp-msg-protocol:symbol-codes ((msg-type (cl:eql 'gnss_track)))
    "Constants for message type 'gnss_track"
  '((:REFERENCE_TRUE_NORTH . 0)
    (:REFERENCE_MAGNETIC_NORTH . 1))
)
(cl:defmethod roslisp-msg-protocol:serialize ((msg <gnss_track>) ostream)
  "Serializes a message object of type '<gnss_track>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'reference)) ostream)
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'heading))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'speed))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <gnss_track>) istream)
  "Deserializes a message object of type '<gnss_track>"
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'reference)) (cl:read-byte istream))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'heading) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'speed) (roslisp-utils:decode-double-float-bits bits)))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<gnss_track>)))
  "Returns string type for a message object of type '<gnss_track>"
  "sensor_msgs_ext/gnss_track")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'gnss_track)))
  "Returns string type for a message object of type 'gnss_track"
  "sensor_msgs_ext/gnss_track")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<gnss_track>)))
  "Returns md5sum for a message object of type '<gnss_track>"
  "81e644c78713ede189d0f70c2953dc7b")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'gnss_track)))
  "Returns md5sum for a message object of type 'gnss_track"
  "81e644c78713ede189d0f70c2953dc7b")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<gnss_track>)))
  "Returns full string definition for message of type '<gnss_track>"
  (cl:format cl:nil "# An instantaneous velocity track as measured by a GNSS receiver.~%~%uint8 reference                       # The direction that the heading is in reference to.~%uint8 REFERENCE_TRUE_NORTH = 0~%uint8 REFERENCE_MAGNETIC_NORTH = 1~%~%float64 heading                         # The global heading of the track w.r.t. the reference [rad].~%float64 speed                           # The scalar speed of the track, [m/s]~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'gnss_track)))
  "Returns full string definition for message of type 'gnss_track"
  (cl:format cl:nil "# An instantaneous velocity track as measured by a GNSS receiver.~%~%uint8 reference                       # The direction that the heading is in reference to.~%uint8 REFERENCE_TRUE_NORTH = 0~%uint8 REFERENCE_MAGNETIC_NORTH = 1~%~%float64 heading                         # The global heading of the track w.r.t. the reference [rad].~%float64 speed                           # The scalar speed of the track, [m/s]~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <gnss_track>))
  (cl:+ 0
     1
     8
     8
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <gnss_track>))
  "Converts a ROS message object to a list"
  (cl:list 'gnss_track
    (cl:cons ':reference (reference msg))
    (cl:cons ':heading (heading msg))
    (cl:cons ':speed (speed msg))
))
