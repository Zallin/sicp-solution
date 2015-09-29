#lang racket

(require rackunit
         "../chapter2/2.7.rkt"
         "../chapter2/2.8.rkt")

(check-equal? (lower-bound (sub-interval (make-interval 1 2) (make-interval 1 2))) 0 "lower bound of (1; 2) - (1; 2) failed")
(check-equal? (lower-bound (sub-interval (make-interval 3 4) (make-interval -2 2))) 5 "lower bound of (3; 4) - (-2; 2) failed")

(check-equal? (upper-bound (sub-interval (make-interval -5 -2) (make-interval -2 0))) -2 "upper bound of (-5; 2) - (-2; 0) failed")
(check-equal? (upper-bound (sub-interval (make-interval 4 5) (make-interval 1 2))) 3 "upper bound of (4; 5) - (1; 2) failed")
