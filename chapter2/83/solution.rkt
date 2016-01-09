#lang racket

; add to rational number package

(define (scheme-number->rational number)
  (make-rational number 1))

(put 'raise '(scheme-number) scheme-number->rational)

; add to real numbers package 

(define (rational->real number)
  (make-real (/ (numer number) (denom number))))

(put 'raise '(rational) rational->real)

; add to complex numbers package

; assuming that real number is represented as a combination of sign, exponent and mantis

(define (real->complex number)
  (let ((factor (if (real-negative? number) -1 1)))
    (make-complex-from-real-imag (* factor (mantis number) (expt (base number) (order number))) 0)))

(put 'raise '(real) real->complex)

; generic procedure
; assuming highest-type predicate implements check whether a type has supertype or not
; this is done in order to prevent infinite cycle 
; raise -> apply-generic (has no operation for the highest type and tries to raise it) -> raise -> ...
; however it is unclear if an error or the type itself should be returned in this case from raise proc

(define (raise type)
  (if (highest-type? type)
    type
    (apply-generic 'raise type)))
