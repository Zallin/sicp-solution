#lang racket

(require rackunit
	 "./filter.rkt")

(check-equal? (filter (lambda (x) (< x 0)) (list -4 -3 -2 2 3 4)) (list -4 -3 -2) "filter of positive numbers failed")
(check-equal? (filter (lambda (x) (even? x)) (list 1 2 3 4 5 6)) (list 2 4 6) "filter of odd numbers failed")
