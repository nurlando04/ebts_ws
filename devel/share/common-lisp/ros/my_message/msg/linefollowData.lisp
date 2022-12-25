; Auto-generated. Do not edit!


(cl:in-package my_message-msg)


;//! \htmlinclude linefollowData.msg.html

(cl:defclass <linefollowData> (roslisp-msg-protocol:ros-message)
  ((mean_squared_error
    :reader mean_squared_error
    :initarg :mean_squared_error
    :type cl:float
    :initform 0.0)
   (y_desired
    :reader y_desired
    :initarg :y_desired
    :type cl:float
    :initform 0.0)
   (y_sensed
    :reader y_sensed
    :initarg :y_sensed
    :type cl:float
    :initform 0.0)
   (wave
    :reader wave
    :initarg :wave
    :type cl:float
    :initform 0.0)
   (numoftrial
    :reader numoftrial
    :initarg :numoftrial
    :type cl:integer
    :initform 0))
)

(cl:defclass linefollowData (<linefollowData>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <linefollowData>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'linefollowData)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name my_message-msg:<linefollowData> is deprecated: use my_message-msg:linefollowData instead.")))

(cl:ensure-generic-function 'mean_squared_error-val :lambda-list '(m))
(cl:defmethod mean_squared_error-val ((m <linefollowData>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader my_message-msg:mean_squared_error-val is deprecated.  Use my_message-msg:mean_squared_error instead.")
  (mean_squared_error m))

(cl:ensure-generic-function 'y_desired-val :lambda-list '(m))
(cl:defmethod y_desired-val ((m <linefollowData>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader my_message-msg:y_desired-val is deprecated.  Use my_message-msg:y_desired instead.")
  (y_desired m))

(cl:ensure-generic-function 'y_sensed-val :lambda-list '(m))
(cl:defmethod y_sensed-val ((m <linefollowData>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader my_message-msg:y_sensed-val is deprecated.  Use my_message-msg:y_sensed instead.")
  (y_sensed m))

(cl:ensure-generic-function 'wave-val :lambda-list '(m))
(cl:defmethod wave-val ((m <linefollowData>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader my_message-msg:wave-val is deprecated.  Use my_message-msg:wave instead.")
  (wave m))

(cl:ensure-generic-function 'numoftrial-val :lambda-list '(m))
(cl:defmethod numoftrial-val ((m <linefollowData>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader my_message-msg:numoftrial-val is deprecated.  Use my_message-msg:numoftrial instead.")
  (numoftrial m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <linefollowData>) ostream)
  "Serializes a message object of type '<linefollowData>"
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'mean_squared_error))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'y_desired))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'y_sensed))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'wave))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let* ((signed (cl:slot-value msg 'numoftrial)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <linefollowData>) istream)
  "Deserializes a message object of type '<linefollowData>"
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'mean_squared_error) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'y_desired) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'y_sensed) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'wave) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'numoftrial) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<linefollowData>)))
  "Returns string type for a message object of type '<linefollowData>"
  "my_message/linefollowData")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'linefollowData)))
  "Returns string type for a message object of type 'linefollowData"
  "my_message/linefollowData")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<linefollowData>)))
  "Returns md5sum for a message object of type '<linefollowData>"
  "7500abf145475ff7fe18c643285d1df5")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'linefollowData)))
  "Returns md5sum for a message object of type 'linefollowData"
  "7500abf145475ff7fe18c643285d1df5")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<linefollowData>)))
  "Returns full string definition for message of type '<linefollowData>"
  (cl:format cl:nil "float32 mean_squared_error~%float32 y_desired~%float32 y_sensed~%float32 wave~%int32 numoftrial~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'linefollowData)))
  "Returns full string definition for message of type 'linefollowData"
  (cl:format cl:nil "float32 mean_squared_error~%float32 y_desired~%float32 y_sensed~%float32 wave~%int32 numoftrial~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <linefollowData>))
  (cl:+ 0
     4
     4
     4
     4
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <linefollowData>))
  "Converts a ROS message object to a list"
  (cl:list 'linefollowData
    (cl:cons ':mean_squared_error (mean_squared_error msg))
    (cl:cons ':y_desired (y_desired msg))
    (cl:cons ':y_sensed (y_sensed msg))
    (cl:cons ':wave (wave msg))
    (cl:cons ':numoftrial (numoftrial msg))
))
