(in-package #:advent2020/test)

(def-suite advent2020)
(in-suite advent2020)

(test day1
  (is (= (day1/solution1) 970816))
  (is (= (day1/solution2) 96047280)))

(test day2
  (is (= (day2/solution1) 542))
  (is (= (day2/solution2) 360)))

(test day3
  (is (= (day3/solution1) 286))
  (is (= (day3/solution2) 3638606400)))

(test day4
  (is (= (day4/solution1) 210))
  (is (= (day4/solution2) 131)))

(test day5
  (is (= (day5/solution1) 987))
  (is (= (day5/solution2) 603)))
