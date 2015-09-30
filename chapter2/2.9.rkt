#lang racket

(require "./2.7.rkt")

(define (rad-interval int)
  (/ (- (upper-bound int) (lower-bound int)) 2))

(provide rad-interval)
