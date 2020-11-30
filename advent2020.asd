;;;; advent2020.asd

(asdf:defsystem #:advent2020
  :description "Advent of Code 2020"
  :author "Stefano Rodighiero <stefano.rodighiero@gmail.com"
  :license  "Artistic"
  :version "0.0.1"
  :serial t
  :depends-on (#:fiveam)
  :components ((:file "package")
               (:file "utils"))
  :in-order-to ((test-op (test-op #:advent2020/test))))

(asdf:defsystem #:advent2020/test
  :depends-on (#:advent2020
               #:fiveam)
  :components ((:module "tests"
                :components ((:file "main"))))
  :perform (test-op (op _) (symbol-call :fiveam :run-all-tests)))
