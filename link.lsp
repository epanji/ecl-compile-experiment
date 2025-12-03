(cl:in-package :cl-user)

(defpackage static
  (:export #:hello-world))

(static:hello-world)

(ext:quit 0)
