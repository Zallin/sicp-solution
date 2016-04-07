#lang racket

(define (partial-sums s)
  (cons-stream (car s)
               (add-streams (partial-sums s)
                            (stream-cdr s))))
