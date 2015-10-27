#lang racket

(require "./solution.rkt")

(display "midpoint of (2, 2) and (3, 3) = ")
(print-point (midpoint-segment (make-segment (make-point 2.0 2.0) (make-point 3.0 3.0))))

(display "midpoint of (4, 4) and (6, 6) = ")
(print-point (midpoint-segment (make-segment (make-point 4.0 4.0) (make-point 6.0 6.0))))

(display "midpoint of (1, 5) and (2, 3) = ")
(print-point (midpoint-segment (make-segment (make-point 1.0 5.0) (make-point 2.0 3.0))))
