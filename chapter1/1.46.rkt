#lang racket

(define (iterative-improve good-enough? improve)

  (define (iter guess)
    (if (good-enough? guess)
        guess
        (iter (improve guess))))

  iter)

(define (sqrt x)

  (define (good-enough? guess)
    (< (abs (- (* guess guess) x)) 0.001))

  (define (improve guess)
    (/ (+ guess (/ x guess)) 2.0))

  ((iterative-improve good-enough? improve) x))

(define tolerance 0.001)

(define (fixed-point f first-guess)

  (define (improve guess) (f guess))

  (define (good-enough? guess)
    (let ((next (improve guess)))
      (< (abs (- guess next)) tolerance)))

  ((iterative-improve good-enough? improve) first-guess))

(provide sqrt
         fixed-point)
