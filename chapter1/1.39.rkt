#lang racket

(require "./1.37.rkt")

(define (tan-cf x k)
  (cont-frac-iter (lambda (i) (if (= i 1) x (- (* x x))))
                  (lambda (i) (+ (* 2.0 (- i 1)) 1))
                  k))

(provide tan-cf)
