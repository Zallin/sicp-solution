#lang racket

(define (average-damp f)
  (lambda (x)(/ (+ (f x) x) 2)))

(provide average-damp)
