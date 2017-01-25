; Auto-generated. Do not edit!


(cl:in-package imu_image-msg)


;//! \htmlinclude imuData.msg.html

(cl:defclass <imuData> (roslisp-msg-protocol:ros-message)
  ((count
    :reader count
    :initarg :count
    :type cl:integer
    :initform 0)
   (timeStamp
    :reader timeStamp
    :initarg :timeStamp
    :type cl:float
    :initform 0.0)
   (gravWithAccel_x
    :reader gravWithAccel_x
    :initarg :gravWithAccel_x
    :type cl:float
    :initform 0.0)
   (gravWithAccel_y
    :reader gravWithAccel_y
    :initarg :gravWithAccel_y
    :type cl:float
    :initform 0.0)
   (gravWithAccel_z
    :reader gravWithAccel_z
    :initarg :gravWithAccel_z
    :type cl:float
    :initform 0.0)
   (quat_w
    :reader quat_w
    :initarg :quat_w
    :type cl:float
    :initform 0.0)
   (quat_x
    :reader quat_x
    :initarg :quat_x
    :type cl:float
    :initform 0.0)
   (quat_y
    :reader quat_y
    :initarg :quat_y
    :type cl:float
    :initform 0.0)
   (quat_z
    :reader quat_z
    :initarg :quat_z
    :type cl:float
    :initform 0.0)
   (linearAccel_x
    :reader linearAccel_x
    :initarg :linearAccel_x
    :type cl:float
    :initform 0.0)
   (linearAccel_y
    :reader linearAccel_y
    :initarg :linearAccel_y
    :type cl:float
    :initform 0.0)
   (linearAccel_z
    :reader linearAccel_z
    :initarg :linearAccel_z
    :type cl:float
    :initform 0.0)
   (gravity_x
    :reader gravity_x
    :initarg :gravity_x
    :type cl:float
    :initform 0.0)
   (gravity_y
    :reader gravity_y
    :initarg :gravity_y
    :type cl:float
    :initform 0.0)
   (gravity_z
    :reader gravity_z
    :initarg :gravity_z
    :type cl:float
    :initform 0.0))
)

(cl:defclass imuData (<imuData>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <imuData>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'imuData)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name imu_image-msg:<imuData> is deprecated: use imu_image-msg:imuData instead.")))

(cl:ensure-generic-function 'count-val :lambda-list '(m))
(cl:defmethod count-val ((m <imuData>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader imu_image-msg:count-val is deprecated.  Use imu_image-msg:count instead.")
  (count m))

(cl:ensure-generic-function 'timeStamp-val :lambda-list '(m))
(cl:defmethod timeStamp-val ((m <imuData>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader imu_image-msg:timeStamp-val is deprecated.  Use imu_image-msg:timeStamp instead.")
  (timeStamp m))

(cl:ensure-generic-function 'gravWithAccel_x-val :lambda-list '(m))
(cl:defmethod gravWithAccel_x-val ((m <imuData>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader imu_image-msg:gravWithAccel_x-val is deprecated.  Use imu_image-msg:gravWithAccel_x instead.")
  (gravWithAccel_x m))

(cl:ensure-generic-function 'gravWithAccel_y-val :lambda-list '(m))
(cl:defmethod gravWithAccel_y-val ((m <imuData>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader imu_image-msg:gravWithAccel_y-val is deprecated.  Use imu_image-msg:gravWithAccel_y instead.")
  (gravWithAccel_y m))

(cl:ensure-generic-function 'gravWithAccel_z-val :lambda-list '(m))
(cl:defmethod gravWithAccel_z-val ((m <imuData>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader imu_image-msg:gravWithAccel_z-val is deprecated.  Use imu_image-msg:gravWithAccel_z instead.")
  (gravWithAccel_z m))

(cl:ensure-generic-function 'quat_w-val :lambda-list '(m))
(cl:defmethod quat_w-val ((m <imuData>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader imu_image-msg:quat_w-val is deprecated.  Use imu_image-msg:quat_w instead.")
  (quat_w m))

(cl:ensure-generic-function 'quat_x-val :lambda-list '(m))
(cl:defmethod quat_x-val ((m <imuData>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader imu_image-msg:quat_x-val is deprecated.  Use imu_image-msg:quat_x instead.")
  (quat_x m))

(cl:ensure-generic-function 'quat_y-val :lambda-list '(m))
(cl:defmethod quat_y-val ((m <imuData>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader imu_image-msg:quat_y-val is deprecated.  Use imu_image-msg:quat_y instead.")
  (quat_y m))

(cl:ensure-generic-function 'quat_z-val :lambda-list '(m))
(cl:defmethod quat_z-val ((m <imuData>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader imu_image-msg:quat_z-val is deprecated.  Use imu_image-msg:quat_z instead.")
  (quat_z m))

(cl:ensure-generic-function 'linearAccel_x-val :lambda-list '(m))
(cl:defmethod linearAccel_x-val ((m <imuData>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader imu_image-msg:linearAccel_x-val is deprecated.  Use imu_image-msg:linearAccel_x instead.")
  (linearAccel_x m))

(cl:ensure-generic-function 'linearAccel_y-val :lambda-list '(m))
(cl:defmethod linearAccel_y-val ((m <imuData>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader imu_image-msg:linearAccel_y-val is deprecated.  Use imu_image-msg:linearAccel_y instead.")
  (linearAccel_y m))

(cl:ensure-generic-function 'linearAccel_z-val :lambda-list '(m))
(cl:defmethod linearAccel_z-val ((m <imuData>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader imu_image-msg:linearAccel_z-val is deprecated.  Use imu_image-msg:linearAccel_z instead.")
  (linearAccel_z m))

(cl:ensure-generic-function 'gravity_x-val :lambda-list '(m))
(cl:defmethod gravity_x-val ((m <imuData>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader imu_image-msg:gravity_x-val is deprecated.  Use imu_image-msg:gravity_x instead.")
  (gravity_x m))

(cl:ensure-generic-function 'gravity_y-val :lambda-list '(m))
(cl:defmethod gravity_y-val ((m <imuData>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader imu_image-msg:gravity_y-val is deprecated.  Use imu_image-msg:gravity_y instead.")
  (gravity_y m))

(cl:ensure-generic-function 'gravity_z-val :lambda-list '(m))
(cl:defmethod gravity_z-val ((m <imuData>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader imu_image-msg:gravity_z-val is deprecated.  Use imu_image-msg:gravity_z instead.")
  (gravity_z m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <imuData>) ostream)
  "Serializes a message object of type '<imuData>"
  (cl:let* ((signed (cl:slot-value msg 'count)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 18446744073709551616) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) unsigned) ostream)
    )
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'timeStamp))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'gravWithAccel_x))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'gravWithAccel_y))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'gravWithAccel_z))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'quat_w))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'quat_x))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'quat_y))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'quat_z))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'linearAccel_x))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'linearAccel_y))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'linearAccel_z))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'gravity_x))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'gravity_y))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'gravity_z))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <imuData>) istream)
  "Deserializes a message object of type '<imuData>"
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'count) (cl:if (cl:< unsigned 9223372036854775808) unsigned (cl:- unsigned 18446744073709551616))))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'timeStamp) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'gravWithAccel_x) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'gravWithAccel_y) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'gravWithAccel_z) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'quat_w) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'quat_x) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'quat_y) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'quat_z) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'linearAccel_x) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'linearAccel_y) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'linearAccel_z) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'gravity_x) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'gravity_y) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'gravity_z) (roslisp-utils:decode-single-float-bits bits)))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<imuData>)))
  "Returns string type for a message object of type '<imuData>"
  "imu_image/imuData")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'imuData)))
  "Returns string type for a message object of type 'imuData"
  "imu_image/imuData")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<imuData>)))
  "Returns md5sum for a message object of type '<imuData>"
  "5325de38e0d380e0ca6702d20e83c608")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'imuData)))
  "Returns md5sum for a message object of type 'imuData"
  "5325de38e0d380e0ca6702d20e83c608")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<imuData>)))
  "Returns full string definition for message of type '<imuData>"
  (cl:format cl:nil "int64 count~%float64 timeStamp~%float32 gravWithAccel_x~%float32 gravWithAccel_y~%float32 gravWithAccel_z~%float32 quat_w~%float32 quat_x~%float32 quat_y~%float32 quat_z~%float32 linearAccel_x~%float32 linearAccel_y~%float32 linearAccel_z~%float32 gravity_x~%float32 gravity_y~%float32 gravity_z~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'imuData)))
  "Returns full string definition for message of type 'imuData"
  (cl:format cl:nil "int64 count~%float64 timeStamp~%float32 gravWithAccel_x~%float32 gravWithAccel_y~%float32 gravWithAccel_z~%float32 quat_w~%float32 quat_x~%float32 quat_y~%float32 quat_z~%float32 linearAccel_x~%float32 linearAccel_y~%float32 linearAccel_z~%float32 gravity_x~%float32 gravity_y~%float32 gravity_z~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <imuData>))
  (cl:+ 0
     8
     8
     4
     4
     4
     4
     4
     4
     4
     4
     4
     4
     4
     4
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <imuData>))
  "Converts a ROS message object to a list"
  (cl:list 'imuData
    (cl:cons ':count (count msg))
    (cl:cons ':timeStamp (timeStamp msg))
    (cl:cons ':gravWithAccel_x (gravWithAccel_x msg))
    (cl:cons ':gravWithAccel_y (gravWithAccel_y msg))
    (cl:cons ':gravWithAccel_z (gravWithAccel_z msg))
    (cl:cons ':quat_w (quat_w msg))
    (cl:cons ':quat_x (quat_x msg))
    (cl:cons ':quat_y (quat_y msg))
    (cl:cons ':quat_z (quat_z msg))
    (cl:cons ':linearAccel_x (linearAccel_x msg))
    (cl:cons ':linearAccel_y (linearAccel_y msg))
    (cl:cons ':linearAccel_z (linearAccel_z msg))
    (cl:cons ':gravity_x (gravity_x msg))
    (cl:cons ':gravity_y (gravity_y msg))
    (cl:cons ':gravity_z (gravity_z msg))
))
