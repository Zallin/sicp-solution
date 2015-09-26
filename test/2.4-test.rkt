#lang racket

(require rackunit
         "../chapter2/2.4.rkt")

(define one-half (custom-cons 1 2))

(check-equal? (custom-car one-half) 1 "car of pair is wrong")
(check-equal? (custom-cdr one-half) 2 "cdr of pair is wrong")
