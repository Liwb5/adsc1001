;; Auto-generated. Do not edit!


(when (boundp 'imu_image::imuData)
  (if (not (find-package "IMU_IMAGE"))
    (make-package "IMU_IMAGE"))
  (shadow 'imuData (find-package "IMU_IMAGE")))
(unless (find-package "IMU_IMAGE::IMUDATA")
  (make-package "IMU_IMAGE::IMUDATA"))

(in-package "ROS")
;;//! \htmlinclude imuData.msg.html


(defclass imu_image::imuData
  :super ros::object
  :slots (_count _timeStamp _gravWithAccel_x _gravWithAccel_y _gravWithAccel_z _quat_w _quat_x _quat_y _quat_z _linearAccel_x _linearAccel_y _linearAccel_z _gravity_x _gravity_y _gravity_z ))

(defmethod imu_image::imuData
  (:init
   (&key
    ((:count __count) 0)
    ((:timeStamp __timeStamp) 0.0)
    ((:gravWithAccel_x __gravWithAccel_x) 0.0)
    ((:gravWithAccel_y __gravWithAccel_y) 0.0)
    ((:gravWithAccel_z __gravWithAccel_z) 0.0)
    ((:quat_w __quat_w) 0.0)
    ((:quat_x __quat_x) 0.0)
    ((:quat_y __quat_y) 0.0)
    ((:quat_z __quat_z) 0.0)
    ((:linearAccel_x __linearAccel_x) 0.0)
    ((:linearAccel_y __linearAccel_y) 0.0)
    ((:linearAccel_z __linearAccel_z) 0.0)
    ((:gravity_x __gravity_x) 0.0)
    ((:gravity_y __gravity_y) 0.0)
    ((:gravity_z __gravity_z) 0.0)
    )
   (send-super :init)
   (setq _count (round __count))
   (setq _timeStamp (float __timeStamp))
   (setq _gravWithAccel_x (float __gravWithAccel_x))
   (setq _gravWithAccel_y (float __gravWithAccel_y))
   (setq _gravWithAccel_z (float __gravWithAccel_z))
   (setq _quat_w (float __quat_w))
   (setq _quat_x (float __quat_x))
   (setq _quat_y (float __quat_y))
   (setq _quat_z (float __quat_z))
   (setq _linearAccel_x (float __linearAccel_x))
   (setq _linearAccel_y (float __linearAccel_y))
   (setq _linearAccel_z (float __linearAccel_z))
   (setq _gravity_x (float __gravity_x))
   (setq _gravity_y (float __gravity_y))
   (setq _gravity_z (float __gravity_z))
   self)
  (:count
   (&optional __count)
   (if __count (setq _count __count)) _count)
  (:timeStamp
   (&optional __timeStamp)
   (if __timeStamp (setq _timeStamp __timeStamp)) _timeStamp)
  (:gravWithAccel_x
   (&optional __gravWithAccel_x)
   (if __gravWithAccel_x (setq _gravWithAccel_x __gravWithAccel_x)) _gravWithAccel_x)
  (:gravWithAccel_y
   (&optional __gravWithAccel_y)
   (if __gravWithAccel_y (setq _gravWithAccel_y __gravWithAccel_y)) _gravWithAccel_y)
  (:gravWithAccel_z
   (&optional __gravWithAccel_z)
   (if __gravWithAccel_z (setq _gravWithAccel_z __gravWithAccel_z)) _gravWithAccel_z)
  (:quat_w
   (&optional __quat_w)
   (if __quat_w (setq _quat_w __quat_w)) _quat_w)
  (:quat_x
   (&optional __quat_x)
   (if __quat_x (setq _quat_x __quat_x)) _quat_x)
  (:quat_y
   (&optional __quat_y)
   (if __quat_y (setq _quat_y __quat_y)) _quat_y)
  (:quat_z
   (&optional __quat_z)
   (if __quat_z (setq _quat_z __quat_z)) _quat_z)
  (:linearAccel_x
   (&optional __linearAccel_x)
   (if __linearAccel_x (setq _linearAccel_x __linearAccel_x)) _linearAccel_x)
  (:linearAccel_y
   (&optional __linearAccel_y)
   (if __linearAccel_y (setq _linearAccel_y __linearAccel_y)) _linearAccel_y)
  (:linearAccel_z
   (&optional __linearAccel_z)
   (if __linearAccel_z (setq _linearAccel_z __linearAccel_z)) _linearAccel_z)
  (:gravity_x
   (&optional __gravity_x)
   (if __gravity_x (setq _gravity_x __gravity_x)) _gravity_x)
  (:gravity_y
   (&optional __gravity_y)
   (if __gravity_y (setq _gravity_y __gravity_y)) _gravity_y)
  (:gravity_z
   (&optional __gravity_z)
   (if __gravity_z (setq _gravity_z __gravity_z)) _gravity_z)
  (:serialization-length
   ()
   (+
    ;; int64 _count
    8
    ;; float64 _timeStamp
    8
    ;; float32 _gravWithAccel_x
    4
    ;; float32 _gravWithAccel_y
    4
    ;; float32 _gravWithAccel_z
    4
    ;; float32 _quat_w
    4
    ;; float32 _quat_x
    4
    ;; float32 _quat_y
    4
    ;; float32 _quat_z
    4
    ;; float32 _linearAccel_x
    4
    ;; float32 _linearAccel_y
    4
    ;; float32 _linearAccel_z
    4
    ;; float32 _gravity_x
    4
    ;; float32 _gravity_y
    4
    ;; float32 _gravity_z
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; int64 _count
#+(or :alpha :irix6 :x86_64)
       (progn (sys::poke _count (send s :buffer) (send s :count) :long) (incf (stream-count s) 8))
#-(or :alpha :irix6 :x86_64)
       (cond ((and (class _count) (= (length (_count . bv)) 2)) ;; bignum
              (write-long (ash (elt (_count . bv) 0) 0) s)
              (write-long (ash (elt (_count . bv) 1) -1) s))
             ((and (class _count) (= (length (_count . bv)) 1)) ;; big1
              (write-long (elt (_count . bv) 0) s)
              (write-long (if (>= _count 0) 0 #xffffffff) s))
             (t                                         ;; integer
              (write-long _count s)(write-long (if (>= _count 0) 0 #xffffffff) s)))
     ;; float64 _timeStamp
       (sys::poke _timeStamp (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float32 _gravWithAccel_x
       (sys::poke _gravWithAccel_x (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _gravWithAccel_y
       (sys::poke _gravWithAccel_y (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _gravWithAccel_z
       (sys::poke _gravWithAccel_z (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _quat_w
       (sys::poke _quat_w (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _quat_x
       (sys::poke _quat_x (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _quat_y
       (sys::poke _quat_y (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _quat_z
       (sys::poke _quat_z (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _linearAccel_x
       (sys::poke _linearAccel_x (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _linearAccel_y
       (sys::poke _linearAccel_y (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _linearAccel_z
       (sys::poke _linearAccel_z (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _gravity_x
       (sys::poke _gravity_x (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _gravity_y
       (sys::poke _gravity_y (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _gravity_z
       (sys::poke _gravity_z (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; int64 _count
#+(or :alpha :irix6 :x86_64)
      (setf _count (prog1 (sys::peek buf ptr- :long) (incf ptr- 8)))
#-(or :alpha :irix6 :x86_64)
      (setf _count (let ((b0 (prog1 (sys::peek buf ptr- :integer) (incf ptr- 4)))
                  (b1 (prog1 (sys::peek buf ptr- :integer) (incf ptr- 4))))
              (cond ((= b1 -1) b0)
                     ((and (= b1  0)
                           (<= lisp::most-negative-fixnum b0 lisp::most-positive-fixnum))
                      b0)
                    ((= b1  0) (make-instance bignum :size 1 :bv (integer-vector b0)))
                    (t (make-instance bignum :size 2 :bv (integer-vector b0 (ash b1 1)))))))
   ;; float64 _timeStamp
     (setq _timeStamp (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float32 _gravWithAccel_x
     (setq _gravWithAccel_x (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _gravWithAccel_y
     (setq _gravWithAccel_y (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _gravWithAccel_z
     (setq _gravWithAccel_z (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _quat_w
     (setq _quat_w (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _quat_x
     (setq _quat_x (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _quat_y
     (setq _quat_y (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _quat_z
     (setq _quat_z (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _linearAccel_x
     (setq _linearAccel_x (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _linearAccel_y
     (setq _linearAccel_y (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _linearAccel_z
     (setq _linearAccel_z (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _gravity_x
     (setq _gravity_x (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _gravity_y
     (setq _gravity_y (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _gravity_z
     (setq _gravity_z (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;;
   self)
  )

(setf (get imu_image::imuData :md5sum-) "5325de38e0d380e0ca6702d20e83c608")
(setf (get imu_image::imuData :datatype-) "imu_image/imuData")
(setf (get imu_image::imuData :definition-)
      "int64 count
float64 timeStamp
float32 gravWithAccel_x
float32 gravWithAccel_y
float32 gravWithAccel_z
float32 quat_w
float32 quat_x
float32 quat_y
float32 quat_z
float32 linearAccel_x
float32 linearAccel_y
float32 linearAccel_z
float32 gravity_x
float32 gravity_y
float32 gravity_z

")



(provide :imu_image/imuData "5325de38e0d380e0ca6702d20e83c608")


