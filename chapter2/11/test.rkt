#lang racket

(require rackunit
         "../7/solution.rkt"
         "../10/solution.rkt"
         "./solution.rkt")

; intervals multiplication procedure tests

(define a (make-interval 1 2))
(define b (make-interval -1 2))
(define c (make-interval -2 -1))

(check-equal? (multiply-intervals a b) (mul-interval a b) "(1; 2) * (-1; 2) failed")
(check-equal? (multiply-intervals a c) (mul-interval a c) "(1; 2) * (-2; -1) failed")
(check-equal? (multiply-intervals a a) (mul-interval a a) "(1; 2) * (1; 2) failed")

(check-equal? (multiply-intervals b a) (mul-interval b a) "(-1; 2) * (1; 2) failed")
(check-equal? (multiply-intervals b c) (mul-interval b c) "(-1; 2) * (-2; -1) failed")
(check-equal? (multiply-intervals b b) (mul-interval b b) "(-1; 2) * (-1; 2) failed")

(check-equal? (multiply-intervals c a) (mul-interval c a) "(-2; -1) * (1; 2)")
(check-equal? (multiply-intervals c b) (mul-interval c b) "(-2; -1) * (-1; 2)")
(check-equal? (multiply-intervals c c) (mul-interval c c) "(-2; -1) * (-2; -1)")
