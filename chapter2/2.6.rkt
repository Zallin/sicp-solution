#lang racket

(define one (lambda (s) (lambda (z) (s z))))

(define two (lambda (s) (lambda (z) (s (s z)))))

(define (sum x y)
  (lambda (s) (lambda (z) ((x s) ((y s) z)))))

(provide sum)
