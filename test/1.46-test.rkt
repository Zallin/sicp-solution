#lang racket

(require rackunit
         "../chapter1/1.46.rkt")

(check-equal? (sqrt 9) 3.00009155413138 "square root of 9 failed")
(check-equal? (sqrt 137) 11.704699917758145 "square root of 137 failed")
(check-equal? (sqrt (+ (sqrt 2) (sqrt 3))) 1.7739279023207892 "square root of sqrt(2) + sqrt(3) failed")

(check-equal? (fixed-point cos 1.0) 0.7395672022122561 "fixed point of cos failed")
(check-equal? (fixed-point (lambda (x) (+ (sin x) (cos x))) 1.0) 1.2583003677191482 "fixed point of sin + cos failed")
