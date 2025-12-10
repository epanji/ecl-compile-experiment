(cl:in-package :cl-user)

(defpackage static
  (:use :common-lisp)
  (:export #:hello-world
           #:fib))

(in-package :static)

;;; (locally
;;;  (declare (notinline mapc))
;;;  (ext:with-backend :c/c++
;;;   (eval-when (:compile-toplevel)
;;;     (c::process-declaim-args
;;;      '((ftype (function (unsigned-byte) unsigned-byte) fib))))
;;;   :bytecodes
;;;   (eval-when (:compile-toplevel)
;;;     (mapc 'proclaim '((ftype (function (unsigned-byte) unsigned-byte) fib)))))
;;;  (eval-when (:load-toplevel :execute)
;;;    (mapc 'proclaim '((ftype (function (unsigned-byte) unsigned-byte) fib)))))
(declaim (ftype (function (unsigned-byte) unsigned-byte) fib))

;;; (progn
;;;  (progn
;;;   (ext:annotate 'fib 'ext:location '(defun fib) 'nil)
;;;   (ext:annotate 'fib :lambda-list nil '(n))
;;;   (si:fset 'fib
;;;            #'(ext:lambda-block fib
;;;                                (n)
;;;                                (declare (si::c-global))
;;;                                (declare (type unsigned-byte n))
;;;                                (cond ((< n 2) n)
;;;                                      (t
;;;                                       (let ((a 0) (b 1))
;;;                                         (declare (type unsigned-byte a b))
;;;                                         (dotimes (i (1- n) b)
;;;                                           (let* ((#:g62 b) (#:g63 (+ a b)))
;;;                                             (setq a #:g62)
;;;                                             (setq b #:g63)
;;;                                             nil))))))))
;;;  nil
;;;  'fib)
(defun fib (n)
  (declare (type unsigned-byte n))
  (cond ((< n 2) n)
        (t (let ((a 0)
                 (b 1))
             (declare (type unsigned-byte a b))
             (dotimes (i (1- n) b)
               (psetq a b b (+ a b)))))))

;;; (progn
;;;  (progn
;;;   (ext:annotate 'hello-world 'ext:location '(defun hello-world) 'nil)
;;;   (ext:annotate 'hello-world :lambda-list nil 'nil)
;;;   (si:fset 'hello-world
;;;            #'(ext:lambda-block hello-world
;;;                                nil
;;;                                (declare (si::c-global))
;;;                                (format t "Hello world!~%"))))
;;;  nil
;;;  'hello-world)
(defun hello-world ()
  (format t "Hello world!~%"))
