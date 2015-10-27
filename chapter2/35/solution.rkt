#lang racket

(require "../other/accumulate/accumulate.rkt")

(define (count-leaves t)
  (accumulate (lambda (x y) (+ x y)) 
	      0
	      (map (lambda (x)
		     (if (pair? x)
		       (count-leaves x)
		       1))
		   t)))

(provide count-leaves)
