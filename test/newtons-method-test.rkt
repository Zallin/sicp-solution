#lang racket

(require rackunit
         "../other/newtons-method.rkt")

(check-equal? (newtons-method (lambda (x) (* x x)) 1.0) 0.0009815491210806832 "failed for y=x^2")
(check-equal? (newtons-method (lambda (x) x) 2.0) 0.0 "failed for y=x")
(check-equal? (newtons-method (lambda (x) (* 2 (- x 4))) 6.0) 4.0 "failed for y=2*(x-4)")
