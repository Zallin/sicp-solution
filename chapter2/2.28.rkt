#lang racket

(define (fringe l)
  (cond ((null? l) '())
        ((not (pair? l)) (list l))
        (else (append (fringe (car l))
                      (fringe (cdr l))))))

(provide fringe)
