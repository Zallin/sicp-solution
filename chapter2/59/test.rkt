#lang racket

(require rackunit
	 "./solution.rkt")

(check-equal? (union-set (list 1 2 3) (list 4 5 6)) (list 6 5 4 1 2 3) "union of two different sets failed")
(check-equal? (union-set (list 1 2 3) (list 1 2 3)) (list 1 2 3) "union of two equal sets failed")
(check-equal? (union-set (list 1 2 3) '()) (list 1 2 3) "union of a set and an empty set failed")
(check-equal? (union-set '() '()) '() "union of empty sets failed")
