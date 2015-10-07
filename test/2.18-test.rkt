#lang racket

(require rackunit
         "../chapter2/2.18.rkt")

(check-equal? (reverse (list 1 2 3 4 5)) (list 5 4 3 2 1) "reversing 1, 2, 3, 4, 5 failed")
(check-equal? (reverse (list 8 7 6 5 4)) (list 4 5 6 7 8) "reversing 8, 7, 6, 5, 4 failed")
(check-equal? (reverse (list 2 4 6 8)) (list 8 6 4 2) "reversing 2, 4, 6, 8 failed")
