#lang racket

(require rackunit
         "./solution.rkt")

(check-equal? (f-rec 3) 3 "f(3)")
(check-equal? (f-rec 5) 11 "f(4)")
(check-equal? (f-rec 0) 0 "f(0)")

(check-equal? (f-iter 3) 3 "f(3)")
(check-equal? (f-iter 5) 11 "f(4)")
(check-equal? (f-iter 0) 0 "f(0)")
