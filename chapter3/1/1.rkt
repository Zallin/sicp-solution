#lang racket

(define (make-accumulator accum-value)
  (lambda (val)
    (set! accum-value (+ accum-value val))
    accum-value))

(provide make-accumulator)
