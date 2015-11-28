#lang racket

(require (only-in "../other/deriv-representation/representation.rkt"
		  variable?
		  same-variable?
		  =number?))

(define (sum? e)
  (cond ((null? e) false)
        ((eq? (car e) '+) true)
        (else (sum? (cdr e)))))

(define (make-sum a1 a2)
  (cond ((=number? a1 0) a2)
        ((=number? a2 0) a1)
        ((and (number? a1) (number? a2)) (+ a1 a2))
        (else (list a1 '+ a2))))

(define (addend e)
  (define (iter prev rest)
    (if (eq? (cadr rest) '+)
        (if (null? prev)
            (car rest)
            (append prev (list (car rest))))
        (iter (append prev (list (car rest) (cadr rest))) (cddr rest))))
  (iter '() e))
  
(define (augend e)
  (if (eq? (car e) '+)
      (if (pair? (cddr e))
           (cdr e)
           (cadr e))
      (augend (cdr e))))

(define (product? e)
  (cond ((null? e) false)
        ((eq? (car e) '*) true)
        (else (product? (cdr e)))))

(define (multiplier p)
  (define (iter prev rest)
    (if (eq? (cadr rest) '*)
        (if (null? prev)
            (car rest)
            (append prev (list (car rest))))
        (iter (append prev (list (car rest) (cadr rest))) (cddr rest))))
  (iter '() p))
  
(define (multiplicand p)
  (if (eq? (car p) '*)
      (if (pair? (cddr p))
          (cdr p)
          (cadr p))
      (multiplicand (cdr p))))

(define (make-product m1 m2)
  (cond ((or (=number? m1 0) (=number? m2 0)) 0)
        ((=number? m1 1) m2)
        ((=number? m2 1) m1)
        (else (list m1 '* m2))))

(define (deriv exp var)
  (cond ((number? exp) 0)
        ((variable? exp)
         (if (same-variable? exp var) 1 0))
        ((sum? exp) (make-sum (deriv (addend exp) var)
                              (deriv (augend exp) var)))
        ((product? exp) (make-sum (make-product (multiplier exp)
                                                (deriv (multiplicand exp) var))
                                  (make-product (deriv (multiplier exp) var)
                                                (multiplicand exp))))
        (else (error "Unknown type of expression"))))

(provide deriv)
