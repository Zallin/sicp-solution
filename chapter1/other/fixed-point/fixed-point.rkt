#lang racket

(define tolerance 0.001)

(define (fixed-point f first-guess)

  (define (good-enough? v1 v2)
    (< (abs (- v1 v2)) tolerance))

  (define (try guess)
    (let ((next (f guess)))
      (if (good-enough? guess next)
          next
          (try next))))

  (try first-guess))

(provide fixed-point)
