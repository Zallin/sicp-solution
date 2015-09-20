#lang racket

(require rackunit
         "../other/fixed-point.rkt")

(check-equal? (fixed-point cos 1.0) 0.7387603198742113 "fixed point of cos failed")
(check-equal? (fixed-point (lambda (x) (+ (sin x) (cos x))) 1.0) 1.259003859740025 "fixed point of sin + cos failed")
