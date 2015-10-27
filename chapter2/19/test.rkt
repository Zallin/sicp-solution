#lang racket

(require rackunit
         "./solution.rkt")

(define us-coins (list 50 25 10 5 1))

(check-equal? (cc 100 us-coins) 292 "count change of 100 by descending us coins failed")
(check-equal? (cc 100 (list 1 5 10 25 50)) 292 "count change of 100 by ascending list of us coins failed")
