;;;; package.lisp

(defpackage #:advent2020
  (:use #:cl #:cl-ppcre)
  (:export day1/solution1
           day1/solution2

           day2/solution1
           day2/solution2))

(defpackage #:advent2020/test
  (:use #:cl
        #:advent2020
        #:fiveam))
