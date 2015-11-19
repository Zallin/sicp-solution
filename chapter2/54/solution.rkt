#lang racket

(define (equal? a b)
  (cond ((and (pair? a) (pair? b)) (and (equal? (car a) (car b))
					(equal? (cdr a) (cdr b))))
	((not (and (pair? a) (pair? b))) (eq? a b))
	(else #f)))

(provide equal?)
