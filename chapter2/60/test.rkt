#lang racket

(require rackunit
	 "./solution.rkt")

(check-equal? (element-of-set? 2 (list 1 2 2 3 44 1 2)) true "element-of-set test failed")
(check-equal? (element-of-set? 8 (list 1 2 3 4 5 6 7 1 2 3 4 5)) false "element-of-set test failed")

(check-equal? (adjoin-set 1 (list 2 1)) (list 1 2 1) "adjoin set test failed")
(check-equal? (adjoin-set 3 (list 1 2)) (list 3 1 2) "adjoin set test failed")
(check-equal? (adjoin-set 1 '()) (list 1) "adjoin set test failed")

(check-equal? (union-set (list 1 2 2 1) (list 1 3 3 1)) (list 3 2 1) "union operation test failed")
(check-equal? (union-set (list 1 2 3) '()) (list 3 2 1) "union operation test failed")

(check-equal? (intersection-set (list 1 2 2 1) (list 1 2 2 1)) (list 2 1) "intersection operation test failed")
(check-equal? (intersection-set (list 1 2) (list 3 4)) '() "intersection operation test failed")
