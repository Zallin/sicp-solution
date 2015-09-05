#lang racket

(require rackunit
         "../chapter1/1.16.rkt")

(check-equal? (fast-expt 2 8) 256 "2^8 failed")
(check-equal? (fast-expt 10 2) 100 "10^2 failed")
(check-equal? (fast-expt 10 3) 1000 "10^3 failed")
(check-equal? (fast-expt 3 3) 27 "3^3 failed")
