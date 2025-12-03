(cl:in-package :cl-user)

(defpackage static
  (:use :common-lisp)
  (:export #:hello-world))

(in-package :static)

(defun hello-world ()
  (format t "Hello world!~%"))
