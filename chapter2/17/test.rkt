#lang racket

(require rackunit
         "./solution.rkt")

(check-equal? (last-pair (list 23 72 149 34)) 34 "last pair of 23, 72, 149, 34 failed")
(check-equal? (last-pair (list -20 34 192 40)) 40 "last pair of -20, 34, 192, 40 failed")
(check-equal? (last-pair (list 15 20 33 0)) 0 "last pair of 15, 20, 33 0 failed")
(check-equal? (last-pair (list -30 12 34 22)) 22 "last pair of -30, 12, 34, 22 failed")
