#lang racket

(require rackunit
	 "./solution.rkt")

(check-equal? (unique-pairs 2) (list (list 2 1)) "unique pairs of 2 failed")
(check-equal? (unique-pairs 3) (list (list 2 1) (list 3 1) (list 3 2)) "unique pairs of 3 failed")
(check-equal? (unique-pairs 4) (list (list 2 1) (list 3 1) (list 3 2) (list 4 1) (list 4 2) (list 4 3)) "unique pairs of 4 failed")

(check-equal? (prime-sum-pairs 6) (list (list 2 1 3) (list 3 2 5) (list 4 1 5) (list 4 3 7) (list 5 2 7) (list 6 1 7) (list 6 5 11)) "prime-sum-pairs of 6 failed")
