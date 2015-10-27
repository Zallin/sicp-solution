#lang racket

(require "../7/solution.rkt")

(define (rad-interval int)
  (/ (- (upper-bound int) (lower-bound int)) 2))

(provide rad-interval)
