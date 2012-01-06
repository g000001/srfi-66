;;;; srfi-66.lisp

(cl:in-package :srfi-66.internal)

#|(define-function (u8vector? vec)
  (every (lambda (x) (typep x '(unsigned-byte 8)))
         vec))|#

#|(define-function (ensure-octet thing)
  (if (not (and (integer? thing)
		(exact? thing)
		(>= thing 0)
		(<= thing 255)))
      (error "not a octet" thing)))|#

#|(define-function (make-u8vector k fill)
  (ensure-octet fill)
  (make-array k
              :initial-element fill
              :element-type '(unsigned-byte 8)))|#

#|(define-function (list->u8vector octets)
  (mapc #'ensure-octet octets)
  (apply #'vector octets))|#

#|(define-function (vector->list vec)
  (coerce vec 'list))|#

#|(define-function (u8vector->list octets)
  (vector->list octets))|#

#|(define-function (u8vector . octets)
  (list->u8vector octets))|#

#|(define-function (u8vector-length u8vector)
  (vector-length u8vector))|#

#|(define-function (u8vector-ref u8vector k)
  (vector-ref u8vector k))|#

#|(define-function (u8vector-set! u8vector k octet)
  (ensure-octet octet)
  (vector-set! u8vector k octet))|#

(define-function (u8vector-copy! source source-start target target-start count)
  (if (>= source-start target-start)
      (do ((i 0 (+ i 1)))
	  ((= i count))
        (u8vector-set! target
                          (+ target-start i)
                          (u8vector-ref source (+ source-start i))))
      (do ((i (- count 1) (- i 1)))
	  ((= i -1))
        (u8vector-set! target
                          (+ target-start i)
                          (u8vector-ref source (+ source-start i))))))

(define-function (u8vector-copy u8vector)
  (let* ((size (u8vector-length u8vector))
	 (copy (make-u8vector size 0)))
    (u8vector-copy! u8vector 0 copy 0 size)
    copy))

(define-function (u8vector=? u8vector-1 u8vector-2)
  (let ((size (u8vector-length u8vector-1)))
    (and (= size (u8vector-length u8vector-2))
	 (labels ((loop (i)
                    (declare (optimize (debug 0) (space 3)))
                    (or (>= i size)
                        (and (= (u8vector-ref u8vector-1 i)
                                (u8vector-ref u8vector-2 i))
                             (loop (+ 1 i))))))
           (loop 0)))))

(define-function (u8vector-compare u8vector-1 u8vector-2)
  (let ((length-1 (u8vector-length u8vector-1))
        (length-2 (u8vector-length u8vector-2)))
    (cond
      ((< length-1 length-2) -1)
      ((> length-1 length-2)  1)
      (:else
       (labels ((loop (i)
                  (declare (optimize (debug 0) (space 3)))
                  (if (= i length-1)
                      0
                      (let ((elt-1 (u8vector-ref u8vector-1 i))
                            (elt-2 (u8vector-ref u8vector-2 i)))
                        (cond ((< elt-1 elt-2) -1)
                              ((> elt-1 elt-2)  1)
                              (:else (loop (+ i 1))))))))
         (loop 0))))))

;;; eof
