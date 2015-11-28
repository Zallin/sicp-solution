#lang racket

(require rackunit
	 "./solution-b.rkt")

(check-equal? (deriv '(x + 3 * (x + y + 2)) 'x) 4 "derivation test failed")
