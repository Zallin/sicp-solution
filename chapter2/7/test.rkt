#lang racket

(require rackunit
         "./solution.rkt")

(check-equal? (upper-bound (make-interval 1 2)) 2 "upper bound of (1; 2) failed")
(check-equal? (upper-bound (make-interval -2 -1)) -1 "upper bound of (-2; -1) failed")
(check-equal? (upper-bound (make-interval -1 0)) 0 "upper bound of (-1; 0) failed")

(check-equal? (lower-bound (make-interval 1 2)) 1 "lower bound of (1; 2) failed")
(check-equal? (lower-bound (make-interval -2 -1)) -2 "lower bound of (-2; -1) failed")
(check-equal? (lower-bound (make-interval -1 0)) -1 "lower bound of (-1; 0) failed")
