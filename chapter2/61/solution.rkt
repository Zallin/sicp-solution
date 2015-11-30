#lang racket

(define (adjoin-set x s)
  (cond  ((null? s) (cons x s))
	 ((= x (car s)) s)
	 ((< x (car s)) (cons x s))
	 ((> x (car s)) (cons (car s) 
			     (adjoin-set x (cdr s))))))

(provide adjoin-set)
