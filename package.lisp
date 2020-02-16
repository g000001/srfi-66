;;;; package.lisp

(cl:in-package cl-user)


(defpackage "https://github.com/g000001/srfi-66"
  (:use)
  (:export make-u8vector
           u8vector?
           u8vector
           u8vector->list
           list->u8vector
           u8vector-length
           u8vector-ref
           u8vector-set!
           u8vector=?
           u8vector-compare
           u8vector-copy!
           u8vector-copy )
  (:import-from "https://github.com/g000001/srfi-4"
                make-u8vector
                u8vector?
                u8vector
                u8vector->list
                list->u8vector
                u8vector-length
                u8vector-ref
                u8vector-set! ))


(defpackage "https://github.com/g000001/srfi-66#internals"
  (:use "https://github.com/g000001/srfi-66"
        cl
        fiveam)
  (:shadowing-import-from "https://github.com/g000001/srfi-23"
                          error)
  (:shadow loop lambda))


;;; *EOF*
