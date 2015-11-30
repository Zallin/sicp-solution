#lang racket

(require rackunit
	 "./solution.rkt")

(check-equal? (adjoin-set 1 '()) (list 1) "adjoining number to empty set failed")
(check-equal? (adjoin-set 3 (list 1 2 3 4)) (list 1 2 3 4) "adjoining number to set which contains this number failed")
(check-equal? (adjoin-set 3 (list 1 2 4)) (list 1 2 3 4) "adjoining number to set failed")
(check-equal? (adjoin-set 4 (list 1 2 3)) (list 1 2 3 4) "adjoining number to set failed")
