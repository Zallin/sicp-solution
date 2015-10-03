#lang racket

(require rackunit
         "../chapter2/2.7.rkt"
         "../chapter2/2.12.rkt")

(define a (make-center-percent 4 50))
(define b (make-center-percent 2 50))
(define c (make-center-percent -4 50))

; constructor tests

(check-equal? a (make-interval 2 6) "constructing of (2; 6) failed")
(check-equal? b (make-interval 1 3) "constructing of (1; 3) failed")
(check-equal? c (make-interval -6 -2) "constructing of (-6; -2) failed")

; center selector tests

(check-equal? (center a) 4 "center of (2; 6) failed")
(check-equal? (center b) 2 "center of (1; 3) failed")
(check-equal? (center c) -4 "center of (-6; 2) failed")

; percent selector tests

(check-equal? (percent (make-center-percent 1 35)) 35 "error in percents of 1 +- 35% failed")
(check-equal? (percent (make-center-percent 5 50)) 50 "error in percent of 5 +- 50% failed")
(check-equal? (percent (make-center-percent -4 15)) 15 "error in percents of 4 +- 15% failed")
(check-equal? (percent (make-center-percent 1 200)) 200 "error in percents of 1 +- 200% failed")
