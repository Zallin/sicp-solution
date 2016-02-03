#lang racket

(require "../other/monte-carlo/monte-carlo.rkt")

(define (random-in-range low high)
  (let ((range (- high low)))
    (+ low (* range (random)))))

(define (square-area x1 y1 x2 y2)
 (* (- x2 x1)
    (- y2 y1)))

(define (estimate-integral x1 y1 x2 y2 f trials)
  (define (predicate)
    (let ((x (random-in-range x1 x2))
          (y (random-in-range y1 y2)))
      (f x y)))
  (* (square-area x1 y1 x2 y2) (monte-carlo trials predicate)))

(provide estimate-integral)
