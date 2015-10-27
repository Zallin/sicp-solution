#lang racket

(define (square x) (* x x))

(define (square-tree-straight l)
  (cond ((null? l) '())
        ((not (pair? l)) (square l))
        (else (cons (square-tree-straight (car l))
                    (square-tree-straight (cdr l))))))

(define (square-tree tree)
  (map (lambda (sub-tree)
          (if (pair? sub-tree)
              (square-tree sub-tree)
              (square sub-tree)))
        tree))

(provide square-tree-straight
         square-tree)
