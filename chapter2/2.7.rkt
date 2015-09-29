#lang racket

(define (make-interval a b)
  (cons a b))

(define (lower-bound int)
  (car int))

(define (upper-bound int)
  (cdr int))


(provide make-interval
         upper-bound
         lower-bound)
