#lang racket

(require "./fixed-point.rkt")

(define dx 0.00001)

(define (newtons-method g guess)

  (define (newton-transform g)

    ; procedure that returns derivative of g using formula from the book

    (define (deriv g)
      (lambda (x) (/ (- (g (+ x dx)) (g x)) dx)))

    (lambda (x) (- x (/ (g x) ((deriv g) x)))))

  (fixed-point (newton-transform g) guess))

(provide newtons-method)
