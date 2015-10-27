#lang racket

(require rackunit
         "./solution.rkt")

(define one-half (custom-cons 2 3))

(check-equal? (custom-car one-half) 2 "car of pair is wrong")
(check-equal? (custom-cdr one-half) 3 "cdr of pair is wrong")
