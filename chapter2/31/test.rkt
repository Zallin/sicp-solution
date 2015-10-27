#lang racket

(require rackunit
         "./solution.rkt")

(define (square x) (* x x))

(define (square-tree tree)
  (tree-map square tree))

; square-tree tests copied from ex. 2.30

(check-equal? (square-tree (list 1 (list 2 (list 3 4) (list 5)) (list 6))) (list 1 (list 4 (list 9 16) (list 25)) (list 36)) "square of (1 (2 (3 4) (5)) (6)) failed")
(check-equal? (square-tree (list 1 2 3 4)) (list 1 4 9 16) "square of (1 2 3 4) failed")

(define (scale-tree tree factor)
  (tree-map (lambda (x) (* x factor))
            tree))

(check-equal? (scale-tree (list 1 (list 2 (list 3 4) (list 5)) (list 6)) 3) (list 3 (list 6 (list 9 12) (list 15)) (list 18)) "scaling tree by factor of 3 failed")
(check-equal? (scale-tree (list 1 2 3 4) -4) (list -4 -8 -12 -16) "scaling tree by factor of -6 failed")
