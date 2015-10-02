#lang racket

(require "./2.7.rkt")

(define (mul-interval x y)
  (let ((p1 (* (lower-bound x) (lower-bound y)))
        (p2 (* (lower-bound x) (upper-bound y)))
        (p3 (* (upper-bound x) (lower-bound y)))
        (p4 (* (upper-bound x) (upper-bound y))))
    (make-interval (min p1 p2 p3 p4)
                   (max p1 p2 p3 p4))))

(define (crosses-zero? int)
  (and (<= (lower-bound int) 0)
       (>= (upper-bound int) 0)))

(define (div-interval x y)
  (if (crosses-zero? y)
        "error: interval crosses zero"
        (mul-interval x
                  (make-interval (/ 1.0 (upper-bound y))
                                 (/ 1.0 (lower-bound y))))))

(provide div-interval
         mul-interval)
