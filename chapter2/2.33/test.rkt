#lang racket

(require rackunit 
	 "./2.33.rkt")

(check-equal? (map (lambda (x) (* x x))
		   (list 1 2 3 4)) 
	      (list 1 4 9 16)
	      "squaring elements of (1 2 3 4) failed")

(check-equal? (map (lambda (x) (+ x 2))
		   (list 5 6 7 8))
	      (list 7 8 9 10)
	      "appending 2 to elements of (5 6 7 8) failed")

(check-equal? (map (lambda (x) (/ x 2))
		   (list 2 4 6 8))
	      (list 1 2 3 4)
	      "dividing by factor of 2 elements of (2 4 6 8) failed")

(check-equal? (append (list 1 2 3)
		      (list 4 5 6))
	      (list 1 2 3 4 5 6)
	      "appending (4 5 6) to (1 2 3) failed")

(check-equal? (append (list 1) 
		      (list 3 4 5))
	      (list 1 3 4 5)
	      "appending (3 4 5) to (1) failed")

(check-equal? (length (list 1 2 3 4))
	      4
	      "length of (1 2 3 4")

(check-equal? (length (list -3 -2 -1 0))
	      4
	      "length of (-3 -2 -1 0")

		      

