#lang racket

(require rackunit
	 "./general.rkt")

(define leaf (make-leaf 'A 2))

(check-equal? (leaf? leaf) true "leaf predicate test failed")
(check-equal? (leaf? (list 1 2 3)) false "leaf predicate test failed")
(check-equal? (symbol-leaf leaf) 'A "leaf symbol selector test failed")
(check-equal? (weight-leaf leaf) 2 "leaf weight selector test failed")

(define tree (make-code-tree (make-leaf 'A 7)
			     (make-leaf 'B 10)))

(check-equal? (left-branch tree) (make-leaf 'A 7) "left branch selector test failed")
(check-equal? (right-branch tree) (make-leaf 'B 10) "right branch selector test failed")
(check-equal? (symbols tree) '(A B) "symbols selector test failed")
(check-equal? (weight tree) 17 "weight selector test failed")
	      


