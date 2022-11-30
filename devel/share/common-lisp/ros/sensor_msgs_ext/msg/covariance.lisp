; Auto-generated. Do not edit!


(cl:in-package sensor_msgs_ext-msg)


;//! \htmlinclude covariance.msg.html

(cl:defclass <covariance> (roslisp-msg-protocol:ros-message)
  ((dimensions
    :reader dimensions
    :initarg :dimensions
    :type cl:integer
    :initform 0)
   (covariance
    :reader covariance
    :initarg :covariance
    :type (cl:vector cl:float)
   :initform (cl:make-array 0 :element-type 'cl:float :initial-element 0.0)))
)

(cl:defclass covariance (<covariance>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <covariance>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'covariance)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name sensor_msgs_ext-msg:<covariance> is deprecated: use sensor_msgs_ext-msg:covariance instead.")))

(cl:ensure-generic-function 'dimensions-val :lambda-list '(m))
(cl:defmethod dimensions-val ((m <covariance>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader sensor_msgs_ext-msg:dimensions-val is deprecated.  Use sensor_msgs_ext-msg:dimensions instead.")
  (dimensions m))

(cl:ensure-generic-function 'covariance-val :lambda-list '(m))
(cl:defmethod covariance-val ((m <covariance>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader sensor_msgs_ext-msg:covariance-val is deprecated.  Use sensor_msgs_ext-msg:covariance instead.")
  (covariance m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <covariance>) ostream)
  "Serializes a message object of type '<covariance>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'dimensions)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'dimensions)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 16) (cl:slot-value msg 'dimensions)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 24) (cl:slot-value msg 'dimensions)) ostream)
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'covariance))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (cl:let ((bits (roslisp-utils:encode-double-float-bits ele)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream)))
   (cl:slot-value msg 'covariance))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <covariance>) istream)
  "Deserializes a message object of type '<covariance>"
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'dimensions)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'dimensions)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) (cl:slot-value msg 'dimensions)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) (cl:slot-value msg 'dimensions)) (cl:read-byte istream))
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'covariance) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'covariance)))
    (cl:dotimes (i __ros_arr_len)
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:aref vals i) (roslisp-utils:decode-double-float-bits bits))))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<covariance>)))
  "Returns string type for a message object of type '<covariance>"
  "sensor_msgs_ext/covariance")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'covariance)))
  "Returns string type for a message object of type 'covariance"
  "sensor_msgs_ext/covariance")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<covariance>)))
  "Returns md5sum for a message object of type '<covariance>"
  "a8fe301b0f306d03958ddc38bec90d10")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'covariance)))
  "Returns md5sum for a message object of type 'covariance"
  "a8fe301b0f306d03958ddc38bec90d10")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<covariance>)))
  "Returns full string definition for message of type '<covariance>"
  (cl:format cl:nil "# The covariance matrix for a sensor measurement.~%~%uint32 dimensions           # The number of independent measurements represented by the covariance matrix.~%float64[] covariance        # The covariance matrix in row-major order.~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'covariance)))
  "Returns full string definition for message of type 'covariance"
  (cl:format cl:nil "# The covariance matrix for a sensor measurement.~%~%uint32 dimensions           # The number of independent measurements represented by the covariance matrix.~%float64[] covariance        # The covariance matrix in row-major order.~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <covariance>))
  (cl:+ 0
     4
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'covariance) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 8)))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <covariance>))
  "Converts a ROS message object to a list"
  (cl:list 'covariance
    (cl:cons ':dimensions (dimensions msg))
    (cl:cons ':covariance (covariance msg))
))
