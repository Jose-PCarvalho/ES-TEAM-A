; Auto-generated. Do not edit!


(cl:in-package sensor_msgs_ext-msg)


;//! \htmlinclude gnss_fix.msg.html

(cl:defclass <gnss_fix> (roslisp-msg-protocol:ros-message)
  ((type
    :reader type
    :initarg :type
    :type cl:fixnum
    :initform 0)
   (mode_selection
    :reader mode_selection
    :initarg :mode_selection
    :type cl:fixnum
    :initform 0)
   (mode
    :reader mode
    :initarg :mode
    :type cl:fixnum
    :initform 0)
   (satellite_count
    :reader satellite_count
    :initarg :satellite_count
    :type cl:fixnum
    :initform 0))
)

(cl:defclass gnss_fix (<gnss_fix>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <gnss_fix>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'gnss_fix)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name sensor_msgs_ext-msg:<gnss_fix> is deprecated: use sensor_msgs_ext-msg:gnss_fix instead.")))

(cl:ensure-generic-function 'type-val :lambda-list '(m))
(cl:defmethod type-val ((m <gnss_fix>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader sensor_msgs_ext-msg:type-val is deprecated.  Use sensor_msgs_ext-msg:type instead.")
  (type m))

(cl:ensure-generic-function 'mode_selection-val :lambda-list '(m))
(cl:defmethod mode_selection-val ((m <gnss_fix>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader sensor_msgs_ext-msg:mode_selection-val is deprecated.  Use sensor_msgs_ext-msg:mode_selection instead.")
  (mode_selection m))

(cl:ensure-generic-function 'mode-val :lambda-list '(m))
(cl:defmethod mode-val ((m <gnss_fix>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader sensor_msgs_ext-msg:mode-val is deprecated.  Use sensor_msgs_ext-msg:mode instead.")
  (mode m))

(cl:ensure-generic-function 'satellite_count-val :lambda-list '(m))
(cl:defmethod satellite_count-val ((m <gnss_fix>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader sensor_msgs_ext-msg:satellite_count-val is deprecated.  Use sensor_msgs_ext-msg:satellite_count instead.")
  (satellite_count m))
(cl:defmethod roslisp-msg-protocol:symbol-codes ((msg-type (cl:eql '<gnss_fix>)))
    "Constants for message type '<gnss_fix>"
  '((:TYPE_NO_FIX . 0)
    (:TYPE_FIX . 1)
    (:TYPE_DIFFERENTIAL . 2)
    (:TYPE_RTK_FIXED . 4)
    (:TYPE_RTK_FLOAT . 5)
    (:TYPE_DEAD_RECKONING . 6)
    (:MODE_SELECTION_MANUAL . 0)
    (:MODE_SELECTION_AUTOMATIC . 1)
    (:MODE_NONE . 0)
    (:MODE_2D . 1)
    (:MODE_3D . 2))
)
(cl:defmethod roslisp-msg-protocol:symbol-codes ((msg-type (cl:eql 'gnss_fix)))
    "Constants for message type 'gnss_fix"
  '((:TYPE_NO_FIX . 0)
    (:TYPE_FIX . 1)
    (:TYPE_DIFFERENTIAL . 2)
    (:TYPE_RTK_FIXED . 4)
    (:TYPE_RTK_FLOAT . 5)
    (:TYPE_DEAD_RECKONING . 6)
    (:MODE_SELECTION_MANUAL . 0)
    (:MODE_SELECTION_AUTOMATIC . 1)
    (:MODE_NONE . 0)
    (:MODE_2D . 1)
    (:MODE_3D . 2))
)
(cl:defmethod roslisp-msg-protocol:serialize ((msg <gnss_fix>) ostream)
  "Serializes a message object of type '<gnss_fix>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'type)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'mode_selection)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'mode)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'satellite_count)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <gnss_fix>) istream)
  "Deserializes a message object of type '<gnss_fix>"
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'type)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'mode_selection)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'mode)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'satellite_count)) (cl:read-byte istream))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<gnss_fix>)))
  "Returns string type for a message object of type '<gnss_fix>"
  "sensor_msgs_ext/gnss_fix")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'gnss_fix)))
  "Returns string type for a message object of type 'gnss_fix"
  "sensor_msgs_ext/gnss_fix")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<gnss_fix>)))
  "Returns md5sum for a message object of type '<gnss_fix>"
  "ac20d1087808fbd5ae6cee3e0e0bee4d")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'gnss_fix)))
  "Returns md5sum for a message object of type 'gnss_fix"
  "ac20d1087808fbd5ae6cee3e0e0bee4d")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<gnss_fix>)))
  "Returns full string definition for message of type '<gnss_fix>"
  (cl:format cl:nil "# Describes the status of a GNSS receiver's fix.~%~%uint8 type                            # The current fix type.~%uint8 TYPE_NO_FIX = 0~%uint8 TYPE_FIX = 1~%uint8 TYPE_DIFFERENTIAL = 2~%uint8 TYPE_RTK_FIXED = 4~%uint8 TYPE_RTK_FLOAT = 5~%uint8 TYPE_DEAD_RECKONING = 6~%~%uint8 mode_selection                  # The selection type for the operating mode.~%uint8 MODE_SELECTION_MANUAL = 0~%uint8 MODE_SELECTION_AUTOMATIC = 1~%~%uint8 mode                            # The current operating mode.~%uint8 MODE_NONE = 0~%uint8 MODE_2D = 1~%uint8 MODE_3D = 2~%~%uint8 satellite_count                 # The number of satellites used in the fix solution.~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'gnss_fix)))
  "Returns full string definition for message of type 'gnss_fix"
  (cl:format cl:nil "# Describes the status of a GNSS receiver's fix.~%~%uint8 type                            # The current fix type.~%uint8 TYPE_NO_FIX = 0~%uint8 TYPE_FIX = 1~%uint8 TYPE_DIFFERENTIAL = 2~%uint8 TYPE_RTK_FIXED = 4~%uint8 TYPE_RTK_FLOAT = 5~%uint8 TYPE_DEAD_RECKONING = 6~%~%uint8 mode_selection                  # The selection type for the operating mode.~%uint8 MODE_SELECTION_MANUAL = 0~%uint8 MODE_SELECTION_AUTOMATIC = 1~%~%uint8 mode                            # The current operating mode.~%uint8 MODE_NONE = 0~%uint8 MODE_2D = 1~%uint8 MODE_3D = 2~%~%uint8 satellite_count                 # The number of satellites used in the fix solution.~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <gnss_fix>))
  (cl:+ 0
     1
     1
     1
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <gnss_fix>))
  "Converts a ROS message object to a list"
  (cl:list 'gnss_fix
    (cl:cons ':type (type msg))
    (cl:cons ':mode_selection (mode_selection msg))
    (cl:cons ':mode (mode msg))
    (cl:cons ':satellite_count (satellite_count msg))
))
