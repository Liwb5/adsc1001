
(cl:in-package :asdf)

(defsystem "imu_image-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils )
  :components ((:file "_package")
    (:file "imuData" :depends-on ("_package_imuData"))
    (:file "_package_imuData" :depends-on ("_package"))
  ))