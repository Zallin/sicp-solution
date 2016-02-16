#lang racket

(require rackunit
         "./solution.rkt")

(define (square-predicate x y)
 (and (>= x 2) (<= x 4) (>= y 2) (<= y 4)))

(check-equal? (round (estimate-integral 1 1 5 5 square-predicate 1000)) 4 "estimating square integral failed")
