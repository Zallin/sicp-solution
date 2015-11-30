#lang racket

(define (element-of-set? x s)
  (cond ((null? s) false)
	((= x (car s)) true)
	(else (element-of-set? x (cdr s)))))

(define (adjoin-set x s)
  (cons x s))

(define (union-set s1 s2)
  (define (iter union rest-of-set)
    (cond ((null? rest-of-set) union)
	  ((element-of-set? (car rest-of-set) union) (iter union (cdr rest-of-set)))
	  (else (iter (cons (car rest-of-set) union) (cdr rest-of-set)))))
  (iter '() (append s1 s2)))

(define (intersection-set s1 s2)
  (define (iter intersection rest-of-set)
    (cond ((null? rest-of-set) intersection)
	  ((and (not (element-of-set? (car rest-of-set) intersection)) (element-of-set? (car rest-of-set) s1))
	   (iter (cons (car rest-of-set) intersection) (cdr rest-of-set)))
	  (else (iter intersection (cdr rest-of-set)))))
  (iter '() s2))

(provide element-of-set?
	 adjoin-set
	 union-set
	 intersection-set)
