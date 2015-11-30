#lang racket

(define (element-of-set? x s)
  (cond ((null? s) false)
	((equal? x (car s)) true)
	(else (element-of-set? x (cdr s)))))

(define (union-set s1 s2)
  (cond ((null? s2) s1)
	((not (element-of-set? (car s2) s1)) (union-set (cons (car s2) s1) (cdr s2)))
	(else (union-set s1 (cdr s2)))))

(provide union-set)
