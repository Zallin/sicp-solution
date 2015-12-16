#lang racket

(require rackunit
	 "./solution.rkt")

(check-equal? (union-set '() '()) '() "union of empty sets failed")
(check-equal? (union-set (list 1 2 3) '()) (list 1 2 3) "union of set and empty set failed")
(check-equal? (union-set '() (list 1 2 3)) (list 1 2 3) "union of set and empty set failed")
(check-equal? (union-set (list 1 2) (list 3 4)) (list 1 2 3 4) "union of sets which do not intersect failed")
(check-equal? (union-set (list 1 2 3 4) (list 3 4 5 6)) (list 1 2 3 4 5 6) "union of sets which intersect failed")

