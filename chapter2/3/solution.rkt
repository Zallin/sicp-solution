#lang racket

(require "../2/solution.rkt")

; auxiliary square proc

(define (square x) (* x x))

; procedure that counts length of a segment

(define (segment-length s)
  (sqrt (+ (square (- (x-point (end-segment s)) (x-point (start-segment s))))
           (square (- (y-point (end-segment s)) (y-point (start-segment s)))))))

; first absraction that implements rectangle as two adjacent segments from 2.2

(define (make-rect-first segment-a segment-b)
  (cons segment-a segment-b))

(define (rect-width-first r)
  (segment-length (car r)))

(define (rect-height-first r)
  (segment-length (cdr r)))

; second absraction that implements rectangle as points at the ends of rect diagonal

(define (make-rect-second point-a point-b)
  (cons point-a point-b))

(define (rect-width-second r)
  (- (x-point (cdr r)) (x-point (car r))))

(define (rect-height-second r)
  (- (y-point (car r)) (y-point (cdr r))))

; square and perim ops modified so that procs that find width and height of a rectangle are given as arguments
; this is done solely for the sake convenience (no need to double code below)

(define (square-rect r rect-width rect-height)
  (* (rect-width r) (rect-height r)))

(define (perim-rect r rect-width rect-height)
  (* 2 (+ (rect-width r) (rect-height r))))

(provide segment-length
         make-rect-first
         rect-width-first
         rect-height-first
         make-rect-second
         rect-width-second
         rect-height-second
         square-rect
         perim-rect)
