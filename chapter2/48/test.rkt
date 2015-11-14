#lang racket

(require rackunit
	 "./solution.rkt")

(define segment (make-segment 1 2))

(check-equal? (start-segment segment) 1 "start segment selector test failed")
(check-equal? (end-segment segment) 2 "end segment selector test failed")
