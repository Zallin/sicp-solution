#lang racket

(require rackunit
	 "./solution.rkt")

(check-equal? (subsets (list 1 2 3)) (list '() (list 3) (list 2) (list 2 3) (list 1) (list 1 3) (list 1 2) (list 1 2 3)) "subsets of (1 2 3) failed")
