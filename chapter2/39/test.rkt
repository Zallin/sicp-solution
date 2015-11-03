#lang racket

(require rackunit
	 "./solution.rkt")

(check-equal? (reverse-right (list 1 2 3 4)) (list 4 3 2 1) "reverse-right of (1 2 3 4) failed")
(check-equal? (reverse-right '()) '() "reverse-right of empty list failed")
(check-equal? (reverse-right (list 1)) (list 1) "reverse-right of (1) failed")

(check-equal? (reverse-left (list 1 2 3 4)) (list 4 3 2 1) "reverse-left of (1 2 3 4) failed")
(check-equal? (reverse-left'()) '() "reverse-left of empty list failed")
(check-equal? (reverse-left (list 1)) (list 1) "reverse-left of (1) failed")

