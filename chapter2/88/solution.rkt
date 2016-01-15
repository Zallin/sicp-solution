#lang racket

(define (sub-poly p1 p2)
  (add-poly p1 (negate-poly p2)))

(define (negate-poly p)
  (make-poly (variable p)
	     (negate-terms (term-list p))))

(define (negate-terms terms)
  (if (null? terms)
    (the-empty-termlist)
    (let ((first-t (first-term terms)))
      (let ((term (make-term (order first-t)
			     (mul (coeff first-t) -1))))
	(adjoin-term term
		     (negate-terms (rest-terms terms)))))))

(put 'sub '(polynomial polynomial) (lambda (p1 p2) (tag (sub-poly p1 p2))))
				 
