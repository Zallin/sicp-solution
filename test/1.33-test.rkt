#lang racket

(require rackunit
         "../chapter1/1.33.rkt")

(check-equal? (sum-of-prime-squares 0 5) 38 "sum of squares from 0 5 failed")
(check-equal? (sum-of-prime-squares 1 3) 13 "sum of squares from 1 3 failed")

(check-equal? (product-of-coprimes 8) 105 "product-of-primes from 1 to 9 failed")
(check-equal? (product-of-coprimes 9) 2240 "product-of-primes from 1 to 4 failed")
