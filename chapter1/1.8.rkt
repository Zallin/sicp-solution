#lang racket

(define (croot x)

; Auxiliary square procedure

  (define (square x)
    (* x x))

; good-enough from 1.7

  (define (good-enough? old new)
    (< (abs (- old new)) 0.001))

; formula implementation

  (define (improve-guess guess)
    (/ (+ (/ x (square guess)) (* 2 guess)) 3))

; analogous to 1.7 sqrt-iter procedure

  (define (sqrt-iter old new)
    (if (good-enough? old new)
        new
        (sqrt-iter new (improve-guess new))))

  (sqrt-iter 1.0 (improve-guess 1.0)))

(provide croot)
