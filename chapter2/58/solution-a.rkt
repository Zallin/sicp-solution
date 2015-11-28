#lang racket

(require (only-in "../other/deriv-representation/representation.rkt"
		  variable?
		  same-variable?
		  =number?)
	 (except-in "../56/solution.rkt"
		    deriv))

(define (sum? e)
  (and (pair? e) (eq? (cadr e) '+)))

(define (addend s)
  (car s))

(define (augend s)
  (caddr s))

(define (make-sum a1 a2)
  (cond ((=number? a1 0) a2)
	((=number? a2 0) a1)
	((and (number? a1) (number? a2)) (+ a1 a2))
	(else (list a1 '+ a2))))

(define (product? e)
  (and (pair? e) (eq? (cadr e) '*)))

(define (multiplier p)
  (car p))

(define (multiplicand p)
  (caddr p))

(define (make-product m1 m2)
  (cond ((or (=number? m1 0) (=number? m2 0)) 0)
	((=number? m1 1) m2)
	((=number? m2 1) m1)
	((and (number? m1) (number? m2)) (* m1 m2))
	(else (list m1 '* m2))))

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
