#lang racket

(require (except-in "../other/deriv-representation/representation.rkt"
		    augend
		    multiplicand)
	 (except-in "../56/solution.rkt"
		    deriv))

(define (augend s)
  (let ((rem (cdddr s)))
    (if (pair? rem)
      (cons '+ (cddr s))
      (caddr s))))

(define (multiplicand p)
  (let ((rem (cdddr p)))
    (if (pair? rem)
      (cons '* (cddr p))
      (caddr p))))

; deriv proc from 2.57

(define (deriv exp var)
  (cond ((number? exp) 0)
        ((variable? exp)
         (if (same-variable? exp var) 1 0))
        ((sum? exp)
         (make-sum (deriv (addend exp) var)
                   (deriv (augend exp) var)))
        ((product? exp)
         (make-sum (make-product (multiplier exp)
                                 (deriv (multiplicand exp) var))
                   (make-product (deriv (multiplier exp) var)
                                 (multiplicand exp))))
        ((exponentiation? exp)
         (make-product (make-product (exponent exp)
                                     (make-exponentiation (base exp)
                                                          (- (exponent exp) 1)))
                       (deriv (base exp) var)))
        (else (error "Unknown type of expression"))))

(provide deriv)
