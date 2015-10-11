#lang racket

(require rackunit
         "../chapter2/2.28.rkt")

(check-equal? (fringe (list (list 1 2) (list 3 4))) (list 1 2 3 4) "fringe of ((1 2) (3 4)) failed")
(check-equal? (fringe (list (list (list 1) 2) 3)) (list 1 2 3) "fringe of (((1) 2) 3) failed")
(check-equal? (fringe (list (list 1 2) (list 3 4) (list 5 6) (list 7 8) 9)) (list 1 2 3 4 5 6 7 8 9) "fringe of ((1 2) (3 4) (5 6) (7 8) 9) failed")
