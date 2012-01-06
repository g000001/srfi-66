;;;; srfi-66.asd

(cl:in-package :asdf)

(defsystem :srfi-66
  :serial t
  :depends-on (:srfi-23 :srfi-4 :fiveam)
  :components ((:file "package")
               (:file "util")
               (:file "srfi-66")
               (:file "test")))

(defmethod perform ((o test-op) (c (eql (find-system :srfi-66))))
  (load-system :srfi-66)
  (or (flet ((_ (pkg sym)
               (intern (symbol-name sym) (find-package pkg))))
         (let ((result (funcall (_ :fiveam :run) (_ :srfi-66.internal :srfi-66))))
           (funcall (_ :fiveam :explain!) result)
           (funcall (_ :fiveam :results-status) result)))
      (error "test-op failed") ))
