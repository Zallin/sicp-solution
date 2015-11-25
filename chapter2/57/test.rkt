#lang racket

(require rackunit
	 "./solution.rkt")

(check-equal? (deriv '(* x y (+ x 3)) 'x) '(+ (* x y) (* y (+ x 3))) "derivation test failed")
(check-equal? (deriv '(+ a b x) 'x) '1 "derivation test failed")
(check-equal? (deriv '(+ (* 2 x) 5 x) 'x) '3 "derivation test failed")
