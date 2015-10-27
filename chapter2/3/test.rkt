#lang racket

(require rackunit
         "../2/solution.rkt"
         "./solution.rkt")

(define seg1 (make-segment (make-point 0 0) (make-point 4 0)))
(define seg2 (make-segment (make-point 0 0) (make-point 0 2)))

; segment length proc tests

(check-equal? (segment-length seg1) 4 "length of seg1 is wrong")
(check-equal? (segment-length seg2) 2 "length of seg2 is wrong")

; first rectangle implementation method

(check-equal? (square-rect (make-rect-first seg1 seg2) rect-width-first rect-height-first) 8 "square of rectangle with sides 2, 4 is wrong")
(check-equal? (perim-rect (make-rect-first seg1 seg2) rect-width-first rect-height-first) 12 "perim of rectangle with sides 2, 4 is wrong")

; second rectangle implementation method

(define point-a (make-point 0 2))
(define point-b (make-point 4 0))

(check-equal? (square-rect (make-rect-second point-a point-b) rect-width-second rect-height-second) 8 "square of rectangle with sides 2, 4 is wrong")
(check-equal? (perim-rect (make-rect-second point-a point-b) rect-width-second rect-height-second) 12 "perim of rectangle with sides 2, 4 is wrong")
