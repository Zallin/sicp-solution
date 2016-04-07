#lang racket

(define (averager a b c)
  (let (sum (make-connector)
       (half-constant (make-connector)))
    (adder a b sum)
    (multiplier sum half-constant c)
    (constant 0.5 half-constant)
    'ok))
