#lang racket

(require rackunit
	 "./solution.rkt")

(define v (make-vect 1 2))

(check-equal? (xcor-vect v) 1 "vector representation test failed")
(check-equal? (ycor-vect v) 2 "vector representation test failed")

(define first (make-vect 1 1))
(define second (make-vect -2 3))

(define add (add-vect first second))
(define sub (sub-vect first second))
(define scale (scale-vect 4 first))

(check-equal? (xcor-vect add) -1 "test of add-vect failed")
(check-equal? (ycor-vect add) 4 "test of add-vect failed")

(check-equal? (xcor-vect sub) 3 "test of sub-vect failed")
(check-equal? (ycor-vect sub) -2 "test of sub-vect failed")

(check-equal? (xcor-vect scale) 4 "test of scale-vect failed")
(check-equal? (ycor-vect scale) 4 "test of scale-vect failed")

