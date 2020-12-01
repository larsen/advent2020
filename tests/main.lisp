(in-package #:advent2020/test)

(def-suite advent2020)
(in-suite advent2020)

(test day1
  (is (= (day1/solution1) 970816))
  (is (= (day1/solution2) 96047280)))

