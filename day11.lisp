(in-package #:advent2020)

(defun read-seats-layout ()
  (let ((raw-grid (uiop:read-file-lines
                   (asdf:system-relative-pathname 'advent2020 "inputs/day11"))))
    (make-array (list 
                 (length raw-grid)
                 (length (first raw-grid)))
                :element-type 'character
                :initial-contents (loop for l in raw-grid
                                        collect (loop for c across l collect c)))))

(defun count-adjacent-occupied-seat (col row layout)
  (let ((directions '((-1 . -1) (+0 . -1) (+1 . -1)
                      (-1 . +0)           (+1 . +0)
                      (-1 . +1) (+0 . +1) (+1 . +1)))
        (max-col (array-dimension layout 0))
        (max-row (array-dimension layout 1)))
    (count #\# (loop for dir in directions
                     for adj-col = (+ col (cdr dir))
                     for adj-row = (+ row (car dir))
                     when (and (>= adj-col 0)
                               (< adj-col max-col)
                               (>= adj-row 0)
                               (< adj-row max-row))
                       collect (aref layout adj-col adj-row)))))

(defun next-state (layout)
  (let ((new-layout (make-array (array-dimensions layout))))
    (loop for col from 0 below (array-dimension new-layout 0)
          do (loop for row from 0 below (array-dimension new-layout 1)
                   do (setf (aref new-layout col row)
                            (case (aref layout col row)
                              (#\L (if (= 0 (count-adjacent-occupied-seat
                                             col row layout))
                                       #\#
                                       #\L))
                              (#\# (if (>= (count-adjacent-occupied-seat
                                             col row layout) 4)
                                       #\L
                                       #\#))
                              (otherwise
                               (aref layout col row))))))
    new-layout))

(defun count-occupied-seats (layout)
  (count #\# (loop for col from 0 below (array-dimension layout 0)
                   append (loop for row from 0 below (array-dimension layout 1)
                                collect (aref layout col row)))))

(defun day11/solution1 ()
  (let ((layout (read-seats-layout))
        (last-iteration-count nil))
    (loop do (setf last-iteration-count (count-occupied-seats layout))
             (setf layout (next-state layout))
             when (= last-iteration-count (count-occupied-seats layout))
               do (return-from day11/solution1 last-iteration-count))))

(defun count-visible-occupied-seat (col row layout)
  (let ((directions '((-1 . -1) (+0 . -1) (+1 . -1)
                      (-1 . +0)           (+1 . +0)
                      (-1 . +1) (+0 . +1) (+1 . +1)))
        (max-col (array-dimension layout 0))
        (max-row (array-dimension layout 1))
        adj-col
        adj-row)
    (labels ((valid-coords (adj-col adj-row)
               (and (>= adj-col 0)
                    (< adj-col max-col)
                    (>= adj-row 0)
                    (< adj-row max-row))))
      (count #\# (loop for dir in directions
                       do (setf adj-col col
                                adj-row row)
                       collect (loop do (incf adj-col (cdr dir))
                                        (incf adj-row (car dir))
                                     when (and (valid-coords adj-col adj-row)
                                               (member (aref layout adj-col adj-row)
                                                       '(#\L #\#)))
                                       return (aref layout adj-col adj-row)
                                     until (not (valid-coords adj-col adj-row))))))))

(defun next-state-tolerant (layout)
  (let ((new-layout (make-array (array-dimensions layout))))
    (loop for col from 0 below (array-dimension new-layout 0)
          do (loop for row from 0 below (array-dimension new-layout 1)
                   do (setf (aref new-layout col row)
                            (case (aref layout col row)
                              (#\L (if (= 0 (count-visible-occupied-seat
                                             col row layout))
                                       #\#
                                       #\L))
                              (#\# (if (>= (count-visible-occupied-seat
                                             col row layout) 5)
                                       #\L
                                       #\#))
                              (otherwise
                               (aref layout col row))))))
    new-layout))

(defun day11/solution2 ()
  (let ((layout (read-seats-layout))
        (last-iteration-count nil))
    (loop do (setf last-iteration-count (count-occupied-seats layout))
             (setf layout (next-state-tolerant layout))
             when (= last-iteration-count (count-occupied-seats layout))
               do (return-from day11/solution2 last-iteration-count))))
