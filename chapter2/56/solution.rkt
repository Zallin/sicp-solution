#lang racket

(require "../other/deriv-representation/representation.rkt")

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

(define (exponentiation? exp)
  (and (pair? exp) (eq? (car exp) '**)))

(define (make-exponentiation base exp)
  (cond ((=number? exp 0) 1)
        ((=number? exp 1) base)
        (else (list '** base exp))))

(define (base exp)
  (cadr exp))

(define (exponent exp)
  (caddr exp))

(provide deriv
	 exponentiation?
	 make-exponentiation
	 base
	 exponent)
