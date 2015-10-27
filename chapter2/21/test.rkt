#lang racket

(require rackunit
         "./solution.rkt")

(check-equal? (square-list (list 1 2 3 4)) (list 1 4 9 16) "squares of 1, 2, 3, 4 are wrong")
(check-equal? (square-list (list -2 0 1 2)) (list 4 0 1 4) "squares of -2, 0, 1, 2 are wrong")
(check-equal? (square-list (list -6 -4 -3)) (list 36 16 9) "squares of -6, -4, -3 are wrong")

(check-equal? (square-list-map (list 1 2 3 4)) (list 1 4 9 16) "squares of 1, 2, 3, 4 are wrong")
(check-equal? (square-list-map (list -2 0 1 2)) (list 4 0 1 4) "squares of -2, 0, 1, 2 are wrong")
(check-equal? (square-list-map (list -6 -4 -3)) (list 36 16 9) "squares of -6, -4, -3 are wrong")
