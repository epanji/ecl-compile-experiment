(cl:in-package :cl-user)

(defpackage static
  (:use :common-lisp)
  (:export #:hello-world
           #:fib))

(in-package :static)

(declaim (ftype (function (unsigned-byte) unsigned-byte) fib))
(defun fib (n)
  (declare (type unsigned-byte n))
  (cond ((<= n 1) n)
        (t (let ((a 0)
                 (b 1)
                 (temp 0))
             (declare (type unsigned-byte a b temp))
             (loop repeat (1- n)
                   do (setf temp (+ a b))
                      (psetf a b b temp))
             b))))

(defun hello-world ()
  (format t "Hello world!~%"))
