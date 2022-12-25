;; Auto-generated. Do not edit!


(when (boundp 'my_message::linefollowData)
  (if (not (find-package "MY_MESSAGE"))
    (make-package "MY_MESSAGE"))
  (shadow 'linefollowData (find-package "MY_MESSAGE")))
(unless (find-package "MY_MESSAGE::LINEFOLLOWDATA")
  (make-package "MY_MESSAGE::LINEFOLLOWDATA"))

(in-package "ROS")
;;//! \htmlinclude linefollowData.msg.html


(defclass my_message::linefollowData
  :super ros::object
  :slots (_mean_squared_error _y_desired _y_sensed _wave _numoftrial ))

(defmethod my_message::linefollowData
  (:init
   (&key
    ((:mean_squared_error __mean_squared_error) 0.0)
    ((:y_desired __y_desired) 0.0)
    ((:y_sensed __y_sensed) 0.0)
    ((:wave __wave) 0.0)
    ((:numoftrial __numoftrial) 0)
    )
   (send-super :init)
   (setq _mean_squared_error (float __mean_squared_error))
   (setq _y_desired (float __y_desired))
   (setq _y_sensed (float __y_sensed))
   (setq _wave (float __wave))
   (setq _numoftrial (round __numoftrial))
   self)
  (:mean_squared_error
   (&optional __mean_squared_error)
   (if __mean_squared_error (setq _mean_squared_error __mean_squared_error)) _mean_squared_error)
  (:y_desired
   (&optional __y_desired)
   (if __y_desired (setq _y_desired __y_desired)) _y_desired)
  (:y_sensed
   (&optional __y_sensed)
   (if __y_sensed (setq _y_sensed __y_sensed)) _y_sensed)
  (:wave
   (&optional __wave)
   (if __wave (setq _wave __wave)) _wave)
  (:numoftrial
   (&optional __numoftrial)
   (if __numoftrial (setq _numoftrial __numoftrial)) _numoftrial)
  (:serialization-length
   ()
   (+
    ;; float32 _mean_squared_error
    4
    ;; float32 _y_desired
    4
    ;; float32 _y_sensed
    4
    ;; float32 _wave
    4
    ;; int32 _numoftrial
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; float32 _mean_squared_error
       (sys::poke _mean_squared_error (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _y_desired
       (sys::poke _y_desired (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _y_sensed
       (sys::poke _y_sensed (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _wave
       (sys::poke _wave (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; int32 _numoftrial
       (write-long _numoftrial s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; float32 _mean_squared_error
     (setq _mean_squared_error (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _y_desired
     (setq _y_desired (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _y_sensed
     (setq _y_sensed (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _wave
     (setq _wave (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; int32 _numoftrial
     (setq _numoftrial (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;;
   self)
  )

(setf (get my_message::linefollowData :md5sum-) "7500abf145475ff7fe18c643285d1df5")
(setf (get my_message::linefollowData :datatype-) "my_message/linefollowData")
(setf (get my_message::linefollowData :definition-)
      "float32 mean_squared_error
float32 y_desired
float32 y_sensed
float32 wave
int32 numoftrial
")



(provide :my_message/linefollowData "7500abf145475ff7fe18c643285d1df5")


