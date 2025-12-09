(cl:in-package :cl-user)

(defpackage static
  (:export #:hello-world
           #:fib))

(static:hello-world)

(let ((*trace-output* *standard-output*))
  (format t "(time (static:fib 7777)): ~A~%" (time (static:fib 7777))))

(ext:quit 0)
