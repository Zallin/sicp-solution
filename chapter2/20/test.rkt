#lang racket

(require rackunit
         "./solution.rkt")

(check-equal? (same-parity 1 2 3 4 5 6 7) (list 1 3 5 7) "same parity of 1, 2, 3, 4, 5, 6, 7 failed")
(check-equal? (same-parity 2 3 4 5 6 7) (list 2 4 6) "same parity of 2, 3, 4, 5, 6, 7 failed")
(check-equal? (same-parity 2 10 14 20) (list 2 10 14 20) "same parity of 2, 10, 14, 20 failed")
