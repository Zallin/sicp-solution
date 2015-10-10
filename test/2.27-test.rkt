#lang racket

(require rackunit
         "../chapter2/2.27.rkt")

(check-equal? (deep-reverse (list (list 2 3) (list 2 4))) (list (list 4 2) (list 3 2)) "deep reverse of ((2 3) (2 4)) failed")
(check-equal? (deep-reverse (list (list 1 2) (list 3 4) (list 5 6))) (list (list 6 5) (list 4 3) (list 2 1)) "deep reverse of ((1 2) (3 4) (5 6) failed)")
(check-equal? (deep-reverse (list (list 1 2) (list 3 4) (list 5 6) (list 7 8))) (list (list 8 7) (list 6 5) (list 4 3) (list 2 1)) "deep reverse of ((1 2) (3 4) (5 6) (7 8))")
(check-equal? (deep-reverse (list 1 2)) (list 2 1) "deep reverse of (1 2) failed")
(check-equal? (deep-reverse (list (list (list 1 2) (list 3 4) 5) 6 7)) (list 7 6 (list 5 (list 4 3) (list 2 1))) "deep reverse of (((1 2) (3 4) 5) 6 7) failed")
