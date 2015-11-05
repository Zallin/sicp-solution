#lang racket

(require rackunit
	 "./enumerate-interval.rkt")

(check-equal? (enumerate-interval -2 2) (list -2 -1 0 1 2) "enumerating interval [-2; 2] failed")
(check-equal? (enumerate-interval 1 0) '() "enumerate-interval when first arg > second arg")
