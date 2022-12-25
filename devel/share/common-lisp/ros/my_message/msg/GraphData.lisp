; Auto-generated. Do not edit!


(cl:in-package my_message-msg)


;//! \htmlinclude GraphData.msg.html

(cl:defclass <GraphData> (roslisp-msg-protocol:ros-message)
  ((ms_error
    :reader ms_error
    :initarg :ms_error
    :type cl:float
    :initform 0.0)
   (force_desired
    :reader force_desired
    :initarg :force_desired
    :type cl:float
    :initform 0.0)
   (force_event
    :reader force_event
    :initarg :force_event
    :type cl:float
    :initform 0.0)
   (force_weiss
    :reader force_weiss
    :initarg :force_weiss
    :type cl:float
    :initform 0.0)
   (force_robot
    :reader force_robot
    :initarg :force_robot
    :type cl:float
    :initform 0.0)
   (force_weiss2
    :reader force_weiss2
    :initarg :force_weiss2
    :type cl:float
    :initform 0.0)
   (delta_z
    :reader delta_z
    :initarg :delta_z
    :type cl:float
    :initform 0.0)
   (desire_ar
    :reader desire_ar
    :initarg :desire_ar
    :type cl:float
    :initform 0.0)
   (sense_ar
    :reader sense_ar
    :initarg :sense_ar
    :type cl:float
    :initform 0.0))
)

(cl:defclass GraphData (<GraphData>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <GraphData>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'GraphData)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name my_message-msg:<GraphData> is deprecated: use my_message-msg:GraphData instead.")))

(cl:ensure-generic-function 'ms_error-val :lambda-list '(m))
(cl:defmethod ms_error-val ((m <GraphData>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader my_message-msg:ms_error-val is deprecated.  Use my_message-msg:ms_error instead.")
  (ms_error m))

(cl:ensure-generic-function 'force_desired-val :lambda-list '(m))
(cl:defmethod force_desired-val ((m <GraphData>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader my_message-msg:force_desired-val is deprecated.  Use my_message-msg:force_desired instead.")
  (force_desired m))

(cl:ensure-generic-function 'force_event-val :lambda-list '(m))
(cl:defmethod force_event-val ((m <GraphData>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader my_message-msg:force_event-val is deprecated.  Use my_message-msg:force_event instead.")
  (force_event m))

(cl:ensure-generic-function 'force_weiss-val :lambda-list '(m))
(cl:defmethod force_weiss-val ((m <GraphData>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader my_message-msg:force_weiss-val is deprecated.  Use my_message-msg:force_weiss instead.")
  (force_weiss m))

(cl:ensure-generic-function 'force_robot-val :lambda-list '(m))
(cl:defmethod force_robot-val ((m <GraphData>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader my_message-msg:force_robot-val is deprecated.  Use my_message-msg:force_robot instead.")
  (force_robot m))

(cl:ensure-generic-function 'force_weiss2-val :lambda-list '(m))
(cl:defmethod force_weiss2-val ((m <GraphData>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader my_message-msg:force_weiss2-val is deprecated.  Use my_message-msg:force_weiss2 instead.")
  (force_weiss2 m))

(cl:ensure-generic-function 'delta_z-val :lambda-list '(m))
(cl:defmethod delta_z-val ((m <GraphData>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader my_message-msg:delta_z-val is deprecated.  Use my_message-msg:delta_z instead.")
  (delta_z m))

(cl:ensure-generic-function 'desire_ar-val :lambda-list '(m))
(cl:defmethod desire_ar-val ((m <GraphData>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader my_message-msg:desire_ar-val is deprecated.  Use my_message-msg:desire_ar instead.")
  (desire_ar m))

(cl:ensure-generic-function 'sense_ar-val :lambda-list '(m))
(cl:defmethod sense_ar-val ((m <GraphData>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader my_message-msg:sense_ar-val is deprecated.  Use my_message-msg:sense_ar instead.")
  (sense_ar m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <GraphData>) ostream)
  "Serializes a message object of type '<GraphData>"
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'ms_error))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'force_desired))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'force_event))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'force_weiss))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'force_robot))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'force_weiss2))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'delta_z))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'desire_ar))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'sense_ar))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <GraphData>) istream)
  "Deserializes a message object of type '<GraphData>"
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'ms_error) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'force_desired) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'force_event) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'force_weiss) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'force_robot) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'force_weiss2) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'delta_z) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'desire_ar) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'sense_ar) (roslisp-utils:decode-single-float-bits bits)))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<GraphData>)))
  "Returns string type for a message object of type '<GraphData>"
  "my_message/GraphData")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'GraphData)))
  "Returns string type for a message object of type 'GraphData"
  "my_message/GraphData")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<GraphData>)))
  "Returns md5sum for a message object of type '<GraphData>"
  "ba85a4112f52168dcee52ccd937505d2")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'GraphData)))
  "Returns md5sum for a message object of type 'GraphData"
  "ba85a4112f52168dcee52ccd937505d2")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<GraphData>)))
  "Returns full string definition for message of type '<GraphData>"
  (cl:format cl:nil "float32 ms_error ~%float64 force_desired~%float32 force_event~%float64 force_weiss~%float32 force_robot~%float64 force_weiss2~%float64 delta_z~%float32 desire_ar~%float32 sense_ar~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'GraphData)))
  "Returns full string definition for message of type 'GraphData"
  (cl:format cl:nil "float32 ms_error ~%float64 force_desired~%float32 force_event~%float64 force_weiss~%float32 force_robot~%float64 force_weiss2~%float64 delta_z~%float32 desire_ar~%float32 sense_ar~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <GraphData>))
  (cl:+ 0
     4
     8
     4
     8
     4
     8
     8
     4
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <GraphData>))
  "Converts a ROS message object to a list"
  (cl:list 'GraphData
    (cl:cons ':ms_error (ms_error msg))
    (cl:cons ':force_desired (force_desired msg))
    (cl:cons ':force_event (force_event msg))
    (cl:cons ':force_weiss (force_weiss msg))
    (cl:cons ':force_robot (force_robot msg))
    (cl:cons ':force_weiss2 (force_weiss2 msg))
    (cl:cons ':delta_z (delta_z msg))
    (cl:cons ':desire_ar (desire_ar msg))
    (cl:cons ':sense_ar (sense_ar msg))
))
