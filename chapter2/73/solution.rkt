#lang racket

(define (addend expr)
  (car expr))

(define (augend expr)
  (cadr expr))

; assuming make-sum constructor has not changed

(define (sum-deriv expr var)
  (make-sum (deriv (addend expr) var)
	    (deriv (augend expr) var)))

(put 'deriv '(+) sum-deriv)

; assuming make-product constructor has not changed

(define (multiplier expr)
  (car expr))

(define (multiplicand expr)
  (cadr expr))

(define (prod-deriv expr var)
  (make-sum 
    (make-product (multiplier expr)
		  (deriv (multiplicand expr) var))
    (make-product (deriv (multiplier expr) var)
		  (multiplicand expr))))

(put 'deriv '(*) prod-deriv)

(define (base expr)
  (car expr))

(define (exponent expr)
  (cadr expr))

(define (make-expt base exponent)
  (attach-tag '^ (list base exponent)))

(define (expt-deriv expr var)
  (make-product 
    (make-product (exponent expr)
		  (make-expt (base expr)
			     (make-sum (exponent expr) -1)))
    (deriv (base expr) var)))

(put 'deriv '(^) expt-deriv)
