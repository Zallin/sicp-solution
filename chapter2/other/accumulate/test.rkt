#lang racket 

(require rackunit 
	 "./accumulate.rkt")

(check-equal? (accumulate + 0 (list 1 2 3)) 6 "accumulate (1 2 3) with + operator failed")
(check-equal? (accumulate - 0 (list 20 10 1)) 11 "accumulate (20 10 1) with - operator failed")
(check-equal? (accumulate (lambda (x y)
			    (* x y))
			  1
			  (list 2 4 6))
	      48
	      "accumulate (2 4 6) with * operator defined via lambda failed")
