#lang racket

(require rackunit
         "../chapter1/1.42.rkt")

(define (inc x) (+ x 1))
(define (square x) (* x x))
(define (double-arg x) (* 2 x))
(define (halve x) (/ x 2))

(check-equal? ((compose square inc) 6) 49 "composition of square and inc failed")
(check-equal? ((compose double-arg halve) 8) 8 "composition of double-arg and halve failed")
(check-equal? ((compose square double-arg) 4) 64 "composition of square and double-arg failed")
