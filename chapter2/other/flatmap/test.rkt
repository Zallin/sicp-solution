#lang racket

(require rackunit
	 "./flatmap.rkt")

(check-equal? (flatmap (lambda (x)
			(map (lambda (y)
			       (list x y))
			     (list x (+ x 1))))
		      (list 1 2 3))
	     (list (list 1 1) (list 1 2) (list 2 2) (list 2 3) (list 3 3) (list 3 4))
	     "flatmap test failed")
