#lang racket

(require rackunit
	 "./solution.rkt")

(check-equal? (accumulate-n +
			    0
			    (list (list 1 2 3) (list 4 5 6) (list 7 8 9) (list 10 11 12)))
	      (list 22 26 30)
	      "accumulate-n of ((1 2 3) (4 5 6) (7 8 9) (10 11 12)) failed")

(check-equal? (accumulate-n -
			    0
			    (list (list 60 50 40) (list 30 20 10) (list 3 2 1)))
	      (list 33 32 31)
	      "accumulate-n of ((60 50 40) (30 20 10) (3 2 1))")
