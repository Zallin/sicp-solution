#lang racket

(define (custom-cons x y)
  (lambda (z) (z x y)))

(define (custom-car z)
  (z (lambda (x y) x)))

(define (custom-cdr z)
  (z (lambda (x y) y)))

(provide custom-cons
         custom-car
         custom-cdr)
