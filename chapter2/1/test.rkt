#lang racket

(require "./solution.rkt")

(display "1/2 * 1/3 = ")
(print-rat (mul-rat (make-rat 1 2) (make-rat 1 3)))

(display "-1/2 * 2/10 = ")
(print-rat (mul-rat (make-rat -1 2) (make-rat 2 10)))

(display "1/-2 * -1/3 = ")
(print-rat (mul-rat (make-rat 1 -2) (make-rat -1 3)))

(display "-1/-2 * -1/4 = ")
(print-rat (mul-rat (make-rat -1 -2) (make-rat -1 4)))
