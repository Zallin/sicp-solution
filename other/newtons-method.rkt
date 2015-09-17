#lang racket

(define tolerance 0.001)
(define dx 0.00001)

(define (fixed-point f first-guess)

  (define (good-enough? v1 v2)
    (< (abs (- v1 v2)) tolerance))

  (define (try guess)
    (let ((next (f guess)))
      (if (good-enough? guess next)
          next
          (try next))))

  (try first-guess))

(define (newtons-method g guess)

  (define (newton-transform g)

    ; procedure that returns derivative of g using formula from the book

    (define (deriv g)
      (lambda (x) (/ (- (g (+ x dx)) (g x)) dx)))

    (lambda (x) (- x (/ (g x) ((deriv g) x)))))

  (fixed-point (newton-transform g) guess))

(provide newtons-method)
