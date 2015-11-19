#lang racket

(require rackunit
	 "./solution.rkt")

; test cases from the book

(check-equal? (equal? '(this is a list) '(this is a list)) #t "equality test failed")
(check-equal? (equal? '(this is a list) '(this (is a) list)) #f "equality test failed")

; some arbitrary tests

(check-equal? (equal? '() '()) #t "equality test of empty lists failed")
(check-equal? (equal? '() '(a)) #f "equality test of empty list and not empty list failed")
(check-equal? (equal? '((x y) (a b)) '((x y) (a b c))) #f "equality test failed")
(check-equal? (equal? 'ac 'ac) #t "equality test failed")
(check-equal? (equal? 'acv 'afg) #f "equality test failed")

