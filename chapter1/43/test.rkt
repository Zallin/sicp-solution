#lang racket

(require rackunit
         "./solution.rkt")

(define (square x) (* x x))
(define (double x) (* 2 x))
(define (halve x) (/ x 2))

(check-equal? ((repeated square 2) 5) 625 "2 times repeated square of 5 failed")
(check-equal? ((repeated double 4) 8) 128 "4 times repeated double failed")
(check-equal? ((repeated halve 3) 64) 8 "3 times repeated halve failed")
