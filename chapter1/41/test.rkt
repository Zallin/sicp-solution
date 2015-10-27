#lang racket

(require rackunit
         "./solution.rkt")

(define (inc x) (+ x 1))
(define (square x) (* x x))
(define (double-arg x) (* 2 x))
(define (halve x) (/ x 2))

(check-equal? ((double inc) 2) 4 "double inc failed")
(check-equal? ((double square) 3) 81 "double square failed")
(check-equal? ((double double-arg) 4) 16 "double double-arg failed")
(check-equal? ((double halve) 16) 4 "double halve failed")
