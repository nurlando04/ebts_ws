;; Auto-generated. Do not edit!


(when (boundp 'my_message::GraphData)
  (if (not (find-package "MY_MESSAGE"))
    (make-package "MY_MESSAGE"))
  (shadow 'GraphData (find-package "MY_MESSAGE")))
(unless (find-package "MY_MESSAGE::GRAPHDATA")
  (make-package "MY_MESSAGE::GRAPHDATA"))

(in-package "ROS")
;;//! \htmlinclude GraphData.msg.html


(defclass my_message::GraphData
  :super ros::object
  :slots (_ms_error _force_desired _force_event _force_weiss _force_robot _force_weiss2 _delta_z _desire_ar _sense_ar ))

(defmethod my_message::GraphData
  (:init
   (&key
    ((:ms_error __ms_error) 0.0)
    ((:force_desired __force_desired) 0.0)
    ((:force_event __force_event) 0.0)
    ((:force_weiss __force_weiss) 0.0)
    ((:force_robot __force_robot) 0.0)
    ((:force_weiss2 __force_weiss2) 0.0)
    ((:delta_z __delta_z) 0.0)
    ((:desire_ar __desire_ar) 0.0)
    ((:sense_ar __sense_ar) 0.0)
    )
   (send-super :init)
   (setq _ms_error (float __ms_error))
   (setq _force_desired (float __force_desired))
   (setq _force_event (float __force_event))
   (setq _force_weiss (float __force_weiss))
   (setq _force_robot (float __force_robot))
   (setq _force_weiss2 (float __force_weiss2))
   (setq _delta_z (float __delta_z))
   (setq _desire_ar (float __desire_ar))
   (setq _sense_ar (float __sense_ar))
   self)
  (:ms_error
   (&optional __ms_error)
   (if __ms_error (setq _ms_error __ms_error)) _ms_error)
  (:force_desired
   (&optional __force_desired)
   (if __force_desired (setq _force_desired __force_desired)) _force_desired)
  (:force_event
   (&optional __force_event)
   (if __force_event (setq _force_event __force_event)) _force_event)
  (:force_weiss
   (&optional __force_weiss)
   (if __force_weiss (setq _force_weiss __force_weiss)) _force_weiss)
  (:force_robot
   (&optional __force_robot)
   (if __force_robot (setq _force_robot __force_robot)) _force_robot)
  (:force_weiss2
   (&optional __force_weiss2)
   (if __force_weiss2 (setq _force_weiss2 __force_weiss2)) _force_weiss2)
  (:delta_z
   (&optional __delta_z)
   (if __delta_z (setq _delta_z __delta_z)) _delta_z)
  (:desire_ar
   (&optional __desire_ar)
   (if __desire_ar (setq _desire_ar __desire_ar)) _desire_ar)
  (:sense_ar
   (&optional __sense_ar)
   (if __sense_ar (setq _sense_ar __sense_ar)) _sense_ar)
  (:serialization-length
   ()
   (+
    ;; float32 _ms_error
    4
    ;; float64 _force_desired
    8
    ;; float32 _force_event
    4
    ;; float64 _force_weiss
    8
    ;; float32 _force_robot
    4
    ;; float64 _force_weiss2
    8
    ;; float64 _delta_z
    8
    ;; float32 _desire_ar
    4
    ;; float32 _sense_ar
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; float32 _ms_error
       (sys::poke _ms_error (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float64 _force_desired
       (sys::poke _force_desired (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float32 _force_event
       (sys::poke _force_event (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float64 _force_weiss
       (sys::poke _force_weiss (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float32 _force_robot
       (sys::poke _force_robot (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float64 _force_weiss2
       (sys::poke _force_weiss2 (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _delta_z
       (sys::poke _delta_z (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float32 _desire_ar
       (sys::poke _desire_ar (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _sense_ar
       (sys::poke _sense_ar (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; float32 _ms_error
     (setq _ms_error (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float64 _force_desired
     (setq _force_desired (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float32 _force_event
     (setq _force_event (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float64 _force_weiss
     (setq _force_weiss (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float32 _force_robot
     (setq _force_robot (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float64 _force_weiss2
     (setq _force_weiss2 (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _delta_z
     (setq _delta_z (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float32 _desire_ar
     (setq _desire_ar (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _sense_ar
     (setq _sense_ar (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;;
   self)
  )

(setf (get my_message::GraphData :md5sum-) "ba85a4112f52168dcee52ccd937505d2")
(setf (get my_message::GraphData :datatype-) "my_message/GraphData")
(setf (get my_message::GraphData :definition-)
      "float32 ms_error 
float64 force_desired
float32 force_event
float64 force_weiss
float32 force_robot
float64 force_weiss2
float64 delta_z
float32 desire_ar
float32 sense_ar

")



(provide :my_message/GraphData "ba85a4112f52168dcee52ccd937505d2")


