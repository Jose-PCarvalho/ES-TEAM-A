
(cl:in-package :asdf)

(defsystem "es_vision-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils )
  :components ((:file "_package")
    (:file "seg_params" :depends-on ("_package_seg_params"))
    (:file "_package_seg_params" :depends-on ("_package"))
  ))