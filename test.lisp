(cl:in-package "https://github.com/g000001/srfi-66#internals")


(def-suite* srfi-66)


(test u8vector
  (is-true (u8vector?
            (make-array 8 :initial-element 0 :element-type '(unsigned-byte 8)) ))
  (is-true (u8vector? (make-u8vector 8 0)))
  (is-true (u8vector? (u8vector 0 1 2 255)))
  (is (equal (u8vector->list (make-u8vector 8 0))
             '(0 0 0 0 0 0 0 0) ))
  (is (equalp (list->u8vector (make-list 8 :initial-element 0))
              (make-u8vector 8 0) ))
  (is (= 8 (u8vector-length (make-u8vector 8 0))))
  (is (zerop (u8vector-ref (make-u8vector 8 0) 5)))
  (is (= 1 (let ((u8v (make-u8vector 8 0)))
             (u8vector-set! u8v 0 1)
             (u8vector-ref u8v 0) )))
  (is-true (u8vector=? (make-u8vector 8 0)
                       (make-u8vector 8 0) ))
  (is-false (u8vector=? (make-u8vector 8 0)
                        (make-u8vector 9 0) ))
  (is-false (u8vector=? (make-u8vector 8 0)
                        (make-u8vector 8 8) ))
  (is (zerop (u8vector-compare (make-u8vector 8 0)
                               (make-u8vector 8 0) )))
  (is (= 1 (u8vector-compare (make-u8vector 8 1)
                             (make-u8vector 8 0) )))
  (is (= -1 (u8vector-compare (make-u8vector 8 0)
                              (make-u8vector 8 1) )))
  (is (= -1 (u8vector-compare (make-u8vector 7 0)
                              (make-u8vector 8 0) )))
  (is (= 1 (u8vector-compare (make-u8vector 8 0)
                             (make-u8vector 7 0) )))
  (let* ((u8v (make-u8vector 8 1))
         (u8v-copy (make-u8vector (u8vector-length u8v) 8)) )
    (u8vector-copy! u8v
                    0
                    u8v-copy
                    0
                    8 )
    (is (u8vector=? u8v
                    u8v-copy )))
  (let ((u8v (make-u8vector 8 1)))
    (is (u8vector=? u8v
                    (u8vector-copy u8v) ))))


;;; *EOF*
