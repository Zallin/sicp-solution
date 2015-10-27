#lang racket

(require rackunit
         "./solution.rkt")

(check-equal? (factorial 9) 362880 "factorial 9 failed")
(check-equal? (factorial 3) 6 "factorial 6 failed")
(check-equal? (factorial 7) 5040 "factorial 7 failed")

(check-equal? (pi 100) 3.1570301764551676 "pi 100 failed")
(check-equal? (pi 150) 3.1519437808296793 "pi 150 failed")
