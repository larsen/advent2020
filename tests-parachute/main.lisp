(in-package #:advent2020/test-parachute)

(define-test advent2020)

(define-test day1
  :parent advent2020
  (is = (day1/solution1) 970816)
  (is = (day1/solution2) 96047280))

(define-test day2
  :parent advent2020
  (is = (day2/solution1) 542)
  (is = (day2/solution2) 360))
