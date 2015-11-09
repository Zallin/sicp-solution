#lang racket

(require rackunit
	 "./solution.rkt")

(check-equal? (adjoin-position 1 1 '()) (list (list 1 1)) "adjoin-position test failed")
(check-equal? (adjoin-position 2 1 (list (list 1 3))) (list (list 1 3) (list 2 1)) "adjoin-position test failed")

(check-equal? (safe? 1 (list (list 1 1))) #t "safe test of elementary case failed")
(check-equal? (safe? 3 (list (list 4 1) (list 6 2) (list 3 3))) #t "safe test of case with no intersections failed")
(check-equal? (safe? 3 (list (list 4 1) (list 2 2) (list 2 3))) #f "safe test of case with horizontal intersection failed")
(check-equal? (safe? 3 (list (list 5 1) (list 1 2) (list 3 3))) #f "safe test of case with diagonal intersection failed") 
		   	
(check-equal? (queens 4) (list (list (list 2 1) (list 4 2) (list 1 3) (list 3 4)) (list (list 3 1) (list 1 2) (list 4 3) (list 2 4))) "queens of 4 failed")
