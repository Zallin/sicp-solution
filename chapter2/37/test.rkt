#lang racket

(require rackunit 
	 "./solution.rkt")

(check-equal? (matrix-*-vector (list (list 1 2)
				     (list 3 4)
				     (list 5 6))
			       (list 1 2))
	      (list 5 11 17)
	      "multiplication of matrix and vector failed")

(check-equal? (matrix-*-matrix (list (list 1 2)
				     (list 3 4))
			       (list (list 1 2)
				     (list 3 4)))
	      (list (list 7 10)
		    (list 15 22))
	      "matrix multiplication failed")
					  
(check-equal? (transpose (list (list 1 2 3)
			       (list 4 5 6)
			       (list 7 8 9)))
	      (list (list 1 4 7)
		    (list 2 5 8)
		    (list 3 6 9))
	      "transposition of matrix failed")
			   

