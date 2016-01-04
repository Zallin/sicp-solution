#lang racket

; add to scheme-number package

(put 'equ? '(scheme-number scheme-number) (lambda (a b) (= a b)))

; add to rational number package

(define (eq-rat x y)
  (and (= (numer x) (numer y))
       (= (denom x) (denom y))))

(put 'equ? '(rational rational) eq-rat)

; add to complex number package 

(define (eq-complex x y)
  (and (= (real-part x) (real-part y))
       (= (imag-part x) (imag-part y))))

(put 'equ? '(complex complex) eq-complex)

(define (equ? a b)
  (apply-generic 'equ? a b))
