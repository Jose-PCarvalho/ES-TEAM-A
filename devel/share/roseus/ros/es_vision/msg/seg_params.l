;; Auto-generated. Do not edit!


(when (boundp 'es_vision::seg_params)
  (if (not (find-package "ES_VISION"))
    (make-package "ES_VISION"))
  (shadow 'seg_params (find-package "ES_VISION")))
(unless (find-package "ES_VISION::SEG_PARAMS")
  (make-package "ES_VISION::SEG_PARAMS"))

(in-package "ROS")
;;//! \htmlinclude seg_params.msg.html


(defclass es_vision::seg_params
  :super ros::object
  :slots (_H_MIN _H_MAX _S_MIN _S_MAX _V_MIN _V_MAX ))

(defmethod es_vision::seg_params
  (:init
   (&key
    ((:H_MIN __H_MIN) 0)
    ((:H_MAX __H_MAX) 0)
    ((:S_MIN __S_MIN) 0)
    ((:S_MAX __S_MAX) 0)
    ((:V_MIN __V_MIN) 0)
    ((:V_MAX __V_MAX) 0)
    )
   (send-super :init)
   (setq _H_MIN (round __H_MIN))
   (setq _H_MAX (round __H_MAX))
   (setq _S_MIN (round __S_MIN))
   (setq _S_MAX (round __S_MAX))
   (setq _V_MIN (round __V_MIN))
   (setq _V_MAX (round __V_MAX))
   self)
  (:H_MIN
   (&optional __H_MIN)
   (if __H_MIN (setq _H_MIN __H_MIN)) _H_MIN)
  (:H_MAX
   (&optional __H_MAX)
   (if __H_MAX (setq _H_MAX __H_MAX)) _H_MAX)
  (:S_MIN
   (&optional __S_MIN)
   (if __S_MIN (setq _S_MIN __S_MIN)) _S_MIN)
  (:S_MAX
   (&optional __S_MAX)
   (if __S_MAX (setq _S_MAX __S_MAX)) _S_MAX)
  (:V_MIN
   (&optional __V_MIN)
   (if __V_MIN (setq _V_MIN __V_MIN)) _V_MIN)
  (:V_MAX
   (&optional __V_MAX)
   (if __V_MAX (setq _V_MAX __V_MAX)) _V_MAX)
  (:serialization-length
   ()
   (+
    ;; uint8 _H_MIN
    1
    ;; uint8 _H_MAX
    1
    ;; uint8 _S_MIN
    1
    ;; uint8 _S_MAX
    1
    ;; uint8 _V_MIN
    1
    ;; uint8 _V_MAX
    1
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; uint8 _H_MIN
       (write-byte _H_MIN s)
     ;; uint8 _H_MAX
       (write-byte _H_MAX s)
     ;; uint8 _S_MIN
       (write-byte _S_MIN s)
     ;; uint8 _S_MAX
       (write-byte _S_MAX s)
     ;; uint8 _V_MIN
       (write-byte _V_MIN s)
     ;; uint8 _V_MAX
       (write-byte _V_MAX s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; uint8 _H_MIN
     (setq _H_MIN (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; uint8 _H_MAX
     (setq _H_MAX (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; uint8 _S_MIN
     (setq _S_MIN (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; uint8 _S_MAX
     (setq _S_MAX (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; uint8 _V_MIN
     (setq _V_MIN (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; uint8 _V_MAX
     (setq _V_MAX (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;;
   self)
  )

(setf (get es_vision::seg_params :md5sum-) "2f911a5cf7426181a62067995d3f9edd")
(setf (get es_vision::seg_params :datatype-) "es_vision/seg_params")
(setf (get es_vision::seg_params :definition-)
      "uint8 H_MIN
uint8 H_MAX
uint8 S_MIN
uint8 S_MAX
uint8 V_MIN
uint8 V_MAX
")



(provide :es_vision/seg_params "2f911a5cf7426181a62067995d3f9edd")


