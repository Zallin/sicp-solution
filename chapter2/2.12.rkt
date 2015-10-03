#lang racket

(require "./2.7.rkt")

(define (make-center-percent c p)
  (let ((w (* (/ p 100) (abs c))))
    (make-interval (- c w) (+ c w))))

(define (center int)
  (/ (+ (lower-bound int) (upper-bound int)) 2))

(define (percent int)
  (* (/ (abs (- (upper-bound int) (center int)))
        (abs (center int)))
     100))

(provide make-center-percent
         center
         percent)
