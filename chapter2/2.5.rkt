#lang racket

(define (custom-cons x y)
  (* (expt 2 x) (expt 3 y)))

(define (custom-car p)
  (let ((r (remainder p 2)))
    (if (= r 0)
        (+ 1 (custom-car (/ p 2)))
        0)))

(define (custom-cdr p)
  (let ((r (remainder p 3)))
    (if (= r 0)
        (+ 1 (custom-cdr (/ p 3)))
        0)))

(provide custom-cons
         custom-car
         custom-cdr)
