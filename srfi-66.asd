;;;; srfi-66.asd

(cl:in-package :asdf)


(defsystem :srfi-66
  :version "20200216"
  :description "SRFI 66 for CL: Octet Vectors"
  :long-description "SRFI 66 for CL: Octet Vectors
https://srfi.schemers.org/srfi-66"
  :author "Michael Sperber"
  :maintainer "CHIBA Masaomi"
  :serial t
  :depends-on (:srfi-23 :srfi-4 :fiveam)
  :components ((:file "package")
               (:file "util")
               (:file "srfi-66")
               (:file "test")))


(defmethod perform :after ((o load-op) (c (eql (find-system :srfi-66))))
  (let ((name "https://github.com/g000001/srfi-66")
        (nickname :srfi-66))
    (if (and (find-package nickname)
             (not (eq (find-package nickname)
                      (find-package name))))
        (warn "~A: A package with name ~A already exists." name nickname)
        (rename-package name name `(,nickname)))))


(defmethod perform ((o test-op) (c (eql (find-system :srfi-66))))
  (let ((*package*
         (find-package
          "https://github.com/g000001/srfi-66#internals")))
    (eval
     (read-from-string
      "
      (or (let ((result (run 'srfi-66)))
            (explain! result)
            (results-status result))
          (error \"test-op failed\") )"))))


;;; *EOF*
