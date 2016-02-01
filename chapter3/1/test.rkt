#lang racket

(require rackunit
	 "./1.rkt")

(define acc (make-accumulator 5))

(check-equal? (acc 10) 15 "accumulator test failed")
(check-equal? (acc 15) 30 "accumulator test failed")
(check-equal? (acc 5) 35 "accumulator test failed")
