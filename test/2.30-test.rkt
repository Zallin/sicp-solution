#lang racket

(require rackunit
         "../chapter2/2.30.rkt")

(check-equal? (square-tree-straight (list 1 (list 2 (list 3 4) (list 5)) (list 6))) (list 1 (list 4 (list 9 16) (list 25)) (list 36)) "square of (1 (2 (3 4) (5)) (6)) failed")
(check-equal? (square-tree-straight (list 1 2 3 4)) (list 1 4 9 16) "square of (1 2 3 4) failed")

(check-equal? (square-tree (list 1 (list 2 (list 3 4) (list 5)) (list 6))) (list 1 (list 4 (list 9 16) (list 25)) (list 36)) "square of (1 (2 (3 4) (5)) (6)) failed")
(check-equal? (square-tree (list 1 2 3 4)) (list 1 4 9 16) "square of (1 2 3 4) failed")
