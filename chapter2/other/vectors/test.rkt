#lang racket

(require rackunit
	 "./vectors.rkt")

(define v (make-vect 1 2))

(check-equal? (xcor-vect v) 1 "vector representation test failed")
(check-equal? (ycor-vect v) 2 "vector representation test failed")

