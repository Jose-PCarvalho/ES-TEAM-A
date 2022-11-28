; Auto-generated. Do not edit!


(cl:in-package es_vision-msg)


;//! \htmlinclude seg_params.msg.html

(cl:defclass <seg_params> (roslisp-msg-protocol:ros-message)
  ((H_MIN
    :reader H_MIN
    :initarg :H_MIN
    :type cl:fixnum
    :initform 0)
   (H_MAX
    :reader H_MAX
    :initarg :H_MAX
    :type cl:fixnum
    :initform 0)
   (S_MIN
    :reader S_MIN
    :initarg :S_MIN
    :type cl:fixnum
    :initform 0)
   (S_MAX
    :reader S_MAX
    :initarg :S_MAX
    :type cl:fixnum
    :initform 0)
   (V_MIN
    :reader V_MIN
    :initarg :V_MIN
    :type cl:fixnum
    :initform 0)
   (V_MAX
    :reader V_MAX
    :initarg :V_MAX
    :type cl:fixnum
    :initform 0))
)

(cl:defclass seg_params (<seg_params>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <seg_params>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'seg_params)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name es_vision-msg:<seg_params> is deprecated: use es_vision-msg:seg_params instead.")))

(cl:ensure-generic-function 'H_MIN-val :lambda-list '(m))
(cl:defmethod H_MIN-val ((m <seg_params>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader es_vision-msg:H_MIN-val is deprecated.  Use es_vision-msg:H_MIN instead.")
  (H_MIN m))

(cl:ensure-generic-function 'H_MAX-val :lambda-list '(m))
(cl:defmethod H_MAX-val ((m <seg_params>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader es_vision-msg:H_MAX-val is deprecated.  Use es_vision-msg:H_MAX instead.")
  (H_MAX m))

(cl:ensure-generic-function 'S_MIN-val :lambda-list '(m))
(cl:defmethod S_MIN-val ((m <seg_params>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader es_vision-msg:S_MIN-val is deprecated.  Use es_vision-msg:S_MIN instead.")
  (S_MIN m))

(cl:ensure-generic-function 'S_MAX-val :lambda-list '(m))
(cl:defmethod S_MAX-val ((m <seg_params>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader es_vision-msg:S_MAX-val is deprecated.  Use es_vision-msg:S_MAX instead.")
  (S_MAX m))

(cl:ensure-generic-function 'V_MIN-val :lambda-list '(m))
(cl:defmethod V_MIN-val ((m <seg_params>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader es_vision-msg:V_MIN-val is deprecated.  Use es_vision-msg:V_MIN instead.")
  (V_MIN m))

(cl:ensure-generic-function 'V_MAX-val :lambda-list '(m))
(cl:defmethod V_MAX-val ((m <seg_params>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader es_vision-msg:V_MAX-val is deprecated.  Use es_vision-msg:V_MAX instead.")
  (V_MAX m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <seg_params>) ostream)
  "Serializes a message object of type '<seg_params>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'H_MIN)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'H_MAX)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'S_MIN)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'S_MAX)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'V_MIN)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'V_MAX)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <seg_params>) istream)
  "Deserializes a message object of type '<seg_params>"
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'H_MIN)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'H_MAX)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'S_MIN)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'S_MAX)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'V_MIN)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'V_MAX)) (cl:read-byte istream))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<seg_params>)))
  "Returns string type for a message object of type '<seg_params>"
  "es_vision/seg_params")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'seg_params)))
  "Returns string type for a message object of type 'seg_params"
  "es_vision/seg_params")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<seg_params>)))
  "Returns md5sum for a message object of type '<seg_params>"
  "2f911a5cf7426181a62067995d3f9edd")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'seg_params)))
  "Returns md5sum for a message object of type 'seg_params"
  "2f911a5cf7426181a62067995d3f9edd")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<seg_params>)))
  "Returns full string definition for message of type '<seg_params>"
  (cl:format cl:nil "uint8 H_MIN~%uint8 H_MAX~%uint8 S_MIN~%uint8 S_MAX~%uint8 V_MIN~%uint8 V_MAX~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'seg_params)))
  "Returns full string definition for message of type 'seg_params"
  (cl:format cl:nil "uint8 H_MIN~%uint8 H_MAX~%uint8 S_MIN~%uint8 S_MAX~%uint8 V_MIN~%uint8 V_MAX~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <seg_params>))
  (cl:+ 0
     1
     1
     1
     1
     1
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <seg_params>))
  "Converts a ROS message object to a list"
  (cl:list 'seg_params
    (cl:cons ':H_MIN (H_MIN msg))
    (cl:cons ':H_MAX (H_MAX msg))
    (cl:cons ':S_MIN (S_MIN msg))
    (cl:cons ':S_MAX (S_MAX msg))
    (cl:cons ':V_MIN (V_MIN msg))
    (cl:cons ':V_MAX (V_MAX msg))
))
