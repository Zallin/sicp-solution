#lang racket

(define (average a b)
  (/ (+ a b) 2))

; segment absraction

(define (make-segment a b)
  (cons a b))

(define (start-segment s)
  (car s))

(define (end-segment s)
  (cdr s))

; point absraction

(define (make-point x y)
  (cons x y))

(define (x-point p)
  (car p))

(define (y-point p)
  (cdr p))

(define (print-point p)
  (display "(")
  (display (x-point p))
  (display ", ")
  (display (y-point p))
  (display ")")
  (newline))

(define (midpoint-segment s)
  (make-point (average (x-point (start-segment s)) (x-point (end-segment s)))
              (average (y-point (start-segment s)) (y-point (end-segment s)))))

(provide make-point
         x-point
         y-point
         print-point
         make-segment
         start-segment
         end-segment
         midpoint-segment)
