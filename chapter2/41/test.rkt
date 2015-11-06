#lang racket

(require rackunit
	 "./solution.rkt")

(check-equal? (unique-triples 4) (list (list 3 2 1) (list 4 2 1) (list 4 3 1) (list 4 3 2)) "unique-triples from 1 to 4 failed")

(check-equal? (pairs-sum 4 7) (list (list 4 2 1)) "pairs-sum with n=4, s=7 failed")
(check-equal? (pairs-sum 1 10) '() "pairs-sum with n=1, s=10 failed")

