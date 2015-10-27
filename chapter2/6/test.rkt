#lang racket

(require rackunit
         "./solution.rkt")

(define (add-1 n)
  (lambda (s) (lambda (z) (s ((n s) z)))))

(define zero (lambda (s) (lambda (z) z)))

(define one (add-1 zero))

(define two (add-1 one))

(define three (add-1 two))

; successor procedure

(define (inc x) (+ x 1))

(check-equal? (((sum zero two) inc) 0) 2 "0 + 2 failed")
(check-equal? (((sum two three) inc) 0) 5 "2 + 3 failed")
(check-equal? (((sum one three) inc) 0) 4 "1 + 3 failed")
