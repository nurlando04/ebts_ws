
(cl:in-package :asdf)

(defsystem "franka_custom_control-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils )
  :components ((:file "_package")
    (:file "JointTorqueComparison" :depends-on ("_package_JointTorqueComparison"))
    (:file "_package_JointTorqueComparison" :depends-on ("_package"))
    (:file "linefollowData" :depends-on ("_package_linefollowData"))
    (:file "_package_linefollowData" :depends-on ("_package"))
  ))