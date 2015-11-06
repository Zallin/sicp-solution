#lang racket

(require "../other/enumerate-interval/enumerate-interval.rkt"
	 "../other/filter/filter.rkt"
	 "../other/flatmap/flatmap.rkt")

(define (unique-triples n)
  (flatmap (lambda (k)
	     (flatmap (lambda (j)
			(map (lambda (i)
			       (list k j i))
			     (enumerate-interval 1 (- j 1))))
		      (enumerate-interval 1 (- k 1))))
	   (enumerate-interval 1 n)))

(define (pairs-sum n s)
  (filter (lambda (triple)
	    (= (+ (car triple) (cadr triple) (car (cddr triple))) s))
	  (unique-triples n)))

(provide unique-triples
	 pairs-sum)
