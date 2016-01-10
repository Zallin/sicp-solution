#lang racket

; add to real numbers package

(define (complex->real number)
  (make-real (real-part number)))

(put 'project '(complex) complex->real)

; add to rational numbers package

(define (extract-rational number)
  (define (iter num den)
    (if (integer? num)
        (cons num den)
        (iter (* num 10) (* den 10))))
  (iter number 1))

(define (real->rational number)
  (let ((rat (extract-rational number)))
    (make-rational (car rat) (cdr rat))))

(put 'project '(real) real->rational number)

; add to scheme-numbers package

(define (rational->scheme-number number)
  (floor (/ (numer number) (denom number))))

(put 'project '(rational) rational->scheme-number)

; generic project procedure 
; doesn t use apply-generic to avoid collisions
; doesn t use table of type coercions because the interface of type tower is unclear

(define (project type)
  (let ((proc (get 'raise (type-tag type))))
    (if proc
        (proc type)
        type)))

(define (drop type)
  (let ((projected (project type)))
    (let ((raised (raise projected)))
      (if (equ? type raised)
          (drop projected)
          type))))

; add to complex numbers package

(define (equ? n1 n2)
  (and (= (real-part n1)
	  (real-part n2))
       (= (imag-part n1)
	  (imag-part n2))))

(put 'equ? '(complex complex) equ?)

; add to rational numbers package

(define (equ? n1 n2)
  (and (= (numer n1) (numer n2))
       (= (denom n1 (denom n2)))))

(put 'equ? '(rational rational) equ?)

; add to scheme-numbers package 

(define (equ? n1 n2)
  (= n1 n2))

(put 'equ? '(scheme-number scheme-number) equ?)

(define (equ? n1 n2)
  (apply-generic 'equ? n1 n2))


