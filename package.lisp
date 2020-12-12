;;;; package.lisp

(defpackage #:advent2020
  (:use #:cl #:cl-ppcre #:alexandria #:split-sequence)
  (:export day1/solution1
           day1/solution2

           day2/solution1
           day2/solution2

           day3/solution1
           day3/solution2

           day4/solution1
           day4/solution2

           day5/solution1
           day5/solution2

           day6/solution1
           day6/solution2

           day7/solution1
           day7/solution2

           day8/solution1
           day8/solution2

           day9/solution1
           day9/solution2

           day10/solution1
           day10/solution2

           day11/solution1
           day11/solution2

           day12/solution1
           day12/solution2))

(defpackage #:advent2020/test
  (:use #:cl
        #:advent2020
        #:fiveam))
