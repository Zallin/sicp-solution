#lang racket

(require rackunit
         "./solution.rkt")

(check-equal? ((smooth (lambda (x) (* 2 x))) 2.0) 4.0 "smooth of 2x failed")
(check-equal? ((smooth (lambda (x) (* x x))) 4.0) 16.0000000066666667 "smooth of x^2 failed")
(check-equal? ((smooth (lambda (x) (* 2 (+ x 2)))) 5.0) 14.0 "smooth of 2(x+2) failed")
