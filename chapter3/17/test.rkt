#lang racket

(require rackunit
         "./solution.rkt")

(define first '(a b c))
(define x (list 'b))
(define second (cons 'a (cons x x)))
(define third (cons (cdr second) (cdr second)))

(check-equal? (count-pairs first) 3 "count pairs in simple list failed")
(check-equal? (count-pairs second) 3 "count pairs in list with two equal pointers failed")
(check-equal? (count-pairs third) 3 "count pairs in list with four equal pointers failed")
