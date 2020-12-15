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

(test day6
  (is (= (day6/solution1) 6742))
  (is (= (day6/solution2) 3447)))

(test day7
  (is (= (day7/solution1) 169))
  (is (= (day7/solution2) 82372)))

(test day8
  (is (= (day8/solution1) 1584))
  (is (= (day8/solution2) 920)))

(test day9
  (is (= (day9/solution1) 22477624))
  (is (= (day9/solution2) 2980044)))

(test day10
  (is (= (day10/solution1) 3000))
  (is (= (day10/solution2) 193434623148032)))

(test day11
  (is (= (day11/solution1) 2238))
  (is (= (day11/solution2) 2013)))

(test day12
  (is (= (day12/solution1) 1007))
  (is (= (day12/solution2) 41212)))

(test day13
  (is (= (day13/solution1) 3606))
  (is (= (day13/solution2) 379786358533423)))

(test day14
  (is (= (day14/solution1) 9879607673316))
  (is (= (day14/solution2) 3435342392262)))

(test day15
  (is (= (day15/solution1) 387))
  (is (= (day15/solution2) 6428)))
