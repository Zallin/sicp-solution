#lang racket

(require rackunit
         "../7/solution.rkt"
         "../8/solution.rkt"
         "./solution.rkt")

; sum of intervals procedure from the book

(define (add-interval x y)
  (make-interval (+ (lower-bound x) (lower-bound y))
                 (+ (upper-bound x) (upper-bound y))))

(define interval-a (make-interval 2 4))
(define interval-b (make-interval 1 2))

(check-equal? (rad-interval (sub-interval interval-a interval-b)) (- (rad-interval interval-a) (rad-interval interval-b)) "radius of difference of interval-a and interval-b failed")
(check-equal? (rad-interval (add-interval interval-a interval-b)) (+ (rad-interval interval-a) (rad-interval interval-b)))
