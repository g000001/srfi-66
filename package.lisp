;;;; package.lisp

(cl:in-package :cl-user)

(defpackage :srfi-66
  (:use)
  (:export :make-u8vector
           :u8vector?
           :u8vector
           :u8vector->list
           :list->u8vector
           :u8vector-length
           :u8vector-ref
           :u8vector-set!
           :u8vector=?
           :u8vector-compare
           :u8vector-copy!
           :u8vector-copy )
  (:import-from :srfi-4
                :make-u8vector
                :u8vector?
                :u8vector
                :u8vector->list
                :list->u8vector
                :u8vector-length
                :u8vector-ref
                :u8vector-set! ))

(defpackage :srfi-66.internal
  (:use :srfi-66 :cl :fiveam)
  (:shadowing-import-from :srfi-23 :error)
  (:shadow :loop :lambda))
