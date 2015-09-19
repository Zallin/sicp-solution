#lang racket

(require rackunit
         "../other/average-damp.rkt")

(check-equal? ((average-damp (lambda (x)(* 2 x))) 4.0) 6.0 "average damp of 2x failed")
(check-equal? ((average-damp (lambda (x)(* x x))) 2.0) 3.0 "average damp of x^2 failed")
(check-equal? ((average-damp (lambda (x)(- (/ x 2)))) 6.0) 1.5 "average damp of -x/2 failed")
