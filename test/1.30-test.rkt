#lang racket

(require rackunit
         "../chapter1/1.30.rkt")

(define (cube x) (* x x x))
(define (identity x) x)
(define (square x) (* x x))

(define (inc n) (+ n 1))

(check-equal? (sum cube 1 inc 10) 3025 "sum of cubes failed")
(check-equal? (sum identity 1 inc 10) 55 "sum of integers failed")
(check-equal? (sum square 1 inc 5) 55 "sum of squares failed")
