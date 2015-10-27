#lang racket

(require "../other/fixed-point/fixed-point.rkt"
         "../other/average-damp/average-damp.rkt"
         "../43/solution.rkt"
         "../16/solution.rkt")

(define (log2 a)
  (/ (log a) (log 2)))

(define (root x n)
  (fixed-point ((repeated average-damp
                          (floor (log2 n)))
                (lambda (y) (/ x (fast-expt y (- n 1)))))
                1.0))

(provide root)
