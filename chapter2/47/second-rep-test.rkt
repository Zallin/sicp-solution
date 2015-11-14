#lang racket

(require rackunit
	 "./second-rep.rkt")

(define frame (make-frame 1 2 3))

(check-equal? (origin-frame frame) 1 "origin selector test failed")
(check-equal? (edge1-frame frame) 2 "edge 1 selector test failed")
(check-equal? (edge2-frame frame) 3 "edge 2 selector test failed")
