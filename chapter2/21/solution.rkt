#lang racket

(define (square x) (* x x))

(define (square-list items)
  (if (null? items)
      '()
      (cons (square (car items))
            (square-list (cdr items)))))

(define (square-list-map items)
  (map (lambda (x) (* x x))
        items))

(provide square-list
         square-list-map)
