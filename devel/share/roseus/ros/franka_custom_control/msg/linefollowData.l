;; Auto-generated. Do not edit!


(when (boundp 'franka_custom_control::linefollowData)
  (if (not (find-package "FRANKA_CUSTOM_CONTROL"))
    (make-package "FRANKA_CUSTOM_CONTROL"))
  (shadow 'linefollowData (find-package "FRANKA_CUSTOM_CONTROL")))
(unless (find-package "FRANKA_CUSTOM_CONTROL::LINEFOLLOWDATA")
  (make-package "FRANKA_CUSTOM_CONTROL::LINEFOLLOWDATA"))

(in-package "ROS")
;;//! \htmlinclude linefollowData.msg.html


(defclass franka_custom_control::linefollowData
  :super ros::object
  :slots (_mean_squared_error _y_sensed _y_desired ))

(defmethod franka_custom_control::linefollowData
  (:init
   (&key
    ((:mean_squared_error __mean_squared_error) 0.0)
    ((:y_sensed __y_sensed) 0.0)
    ((:y_desired __y_desired) 0.0)
    )
   (send-super :init)
   (setq _mean_squared_error (float __mean_squared_error))
   (setq _y_sensed (float __y_sensed))
   (setq _y_desired (float __y_desired))
   self)
  (:mean_squared_error
   (&optional __mean_squared_error)
   (if __mean_squared_error (setq _mean_squared_error __mean_squared_error)) _mean_squared_error)
  (:y_sensed
   (&optional __y_sensed)
   (if __y_sensed (setq _y_sensed __y_sensed)) _y_sensed)
  (:y_desired
   (&optional __y_desired)
   (if __y_desired (setq _y_desired __y_desired)) _y_desired)
  (:serialization-length
   ()
   (+
    ;; float32 _mean_squared_error
    4
    ;; float32 _y_sensed
    4
    ;; float32 _y_desired
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; float32 _mean_squared_error
       (sys::poke _mean_squared_error (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _y_sensed
       (sys::poke _y_sensed (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _y_desired
       (sys::poke _y_desired (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; float32 _mean_squared_error
     (setq _mean_squared_error (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _y_sensed
     (setq _y_sensed (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _y_desired
     (setq _y_desired (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;;
   self)
  )

(setf (get franka_custom_control::linefollowData :md5sum-) "56d6b7140d97f10c0e7ce09693345f49")
(setf (get franka_custom_control::linefollowData :datatype-) "franka_custom_control/linefollowData")
(setf (get franka_custom_control::linefollowData :definition-)
      "float32 mean_squared_error
float32 y_sensed
float32 y_desired

")



(provide :franka_custom_control/linefollowData "56d6b7140d97f10c0e7ce09693345f49")


