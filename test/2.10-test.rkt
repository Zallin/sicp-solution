#lang racket

(require rackunit
         "../chapter2/2.7.rkt"
         "../chapter2/2.10.rkt")

(define interval-a (make-interval -4 2))
(define interval-b (make-interval 1 2))
(define interval-c (make-interval -4 -2))

(check-equal? (div-interval interval-a interval-b) (make-interval -4.0 2.0) "error in dividing (-4; 2) by (1; 2)")
(check-equal? (div-interval interval-a interval-c) (make-interval -1.0 2.0) "error in dividing (-4; 2) by (-4; 2)")
(check-equal? (div-interval interval-a interval-a) "error: interval crosses zero" "error in dividing (-4; 2) by (-4; 2)")

(check-equal? (div-interval interval-b interval-a) "error: interval crosses zero" "error in dividing (1; 2) by (-4; 2)")
(check-equal? (div-interval interval-b interval-c) (make-interval -1.0 -0.25) "error in dividing (1; 2) by (-4; 2)")
(check-equal? (div-interval interval-b interval-b) (make-interval 0.5 2.0) "error in dividing (1; 2) by (1; 2)")

(check-equal? (div-interval interval-c interval-a) "error: interval crosses zero" "error in dividing (-4; -2) by (-4; 2)")
(check-equal? (div-interval interval-c interval-b) (make-interval -4.0 -1.0) "error in dividing (-4; -2) by (1; 2)")
(check-equal? (div-interval interval-c interval-c) (make-interval 0.5 2.0) "error in dividing (-4; -2) by (-4; -2)")
