#lang racket

(require rackunit
         "./solution.rkt")

(define f (make-f))

(check-equal? (+ (f 0) (f 1)) 0 "left-hand computation test failed")
(define half (f 1))
(check-equal? (+ (f 0) half) 1 "right-hand computation test failed")
