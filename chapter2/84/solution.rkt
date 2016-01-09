#lang racket

; for instance, type tower can be implemented as a list of types
; then subtype? predicate checks whether first argument comes before the second in the list

(define (apply-generic op . args)
  (let ((type-tags (map type-tag args)))
    (let ((op (get op type-tags)))
      (if op
	(apply op (map contents args))
	(if (= (length args) 2)
	  (let ((first-type (car args))
		(second-type (cadr args)))
	    (cond ((and (highest-type? first-type) (highest-type? second-type)) (error "no method for these types"))
		  ((subtype? first-type second-type) (apply apply-generic (list op (raise first-type) second-type)))
		  ((subtype? second-type first-type) (apply apply-generic (list op first-type (raise second-type))))
		  (else (apply apply-generic (list op (raise first-type) (raise second-type))))))
	  (error "no method for these types"))))))

