#lang racket

(require rackunit
         "../chapter1/1.29.rkt")

(define (cube x) (* x x x))

(check-equal? (simpsons-integral cube 0 1 100) 0.5 "failed for n = 100")
(check-equal? (simpsons-integral cube 0 1 1000) 0.5 "failed for n = 1000")
