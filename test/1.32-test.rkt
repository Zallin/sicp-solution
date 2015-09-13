#lang racket

(require rackunit
         "../chapter1/1.32.rkt")

(define (identity x) x)
(define (increase-by-two x) (+ x 2))

(define (next x) (+ x 1))

(check-equal? (sum-rec identity 0 next 6) 21 "sum from 0 to 6 failed")
(check-equal? (sum-iter increase-by-two 0 next 4) 20 "sum from 0 to 4 failed")

(check-equal? (product-rec identity 1 next 6) 720 "factorial 6 failed")
(check-equal? (product-iter identity 1 next 7) 5040 "factorial 7 failed")
