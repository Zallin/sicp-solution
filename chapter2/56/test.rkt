#lang racket

(require rackunit
	 "./solution.rkt")

(define expression (make-exponentiation 2 4))

(check-equal? (base expression) 2 "base selector test failed")
(check-equal? (exponent expression) 4 "exponent selector test failed")
(check-equal? (exponentiation? expression) true "exponentiation? predicate test failed")
(check-equal? (exponentiation? (list 1 2 3)) false "exponentiation? predicate test failed")
(check-equal? (exponentiation? (+ 1 2)) false "exponentiation? predicate test failed")

; tests from the book

(check-equal? (deriv '(+ x 3) 'x) 1 "derivation failed")
(check-equal? (deriv '(* (* x y) (+ x 3)) 'x) '(+ (* x y) (* y (+ x 3))) "derivation failed")

; test of exponent derivation

(check-equal? (deriv '(** x 3) 'x) '(* 3 (** x 2)) "derivation failed")
