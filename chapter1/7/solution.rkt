#lang racket

; auxiliary procedures

(define (average a b)
  (/ (+ a b) 2))

(define (improve-guess guess x)
  (average guess (/ x guess)))

; 1.7 task procedure

(define (good-enough? old new)
  (define (square x) (* x x))
  (< (abs (- old new)) 0.001))

; version that uses two parameters

(define (sqrt-a x)
  (define (sqrt-iter old new)
    (if (good-enough? old new)
        new
        (sqrt-iter new (improve-guess new x))))
  (sqrt-iter 1.0 (improve-guess 1.0 x)))

; version that uses one parameter

(define (sqrt-b x)
  (define (sqrt-iter old)
    (define new (improve-guess old x))
    (if (good-enough? old new)
        new
        (sqrt-iter new)))
  (sqrt-iter 1.0))

(provide sqrt-a
         sqrt-b)
