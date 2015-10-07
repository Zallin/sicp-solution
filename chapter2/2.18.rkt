#lang racket

(define (reverse l)
  (define (reverse-rec n)
    (if (< n 0)
        '()
        (cons (list-ref l n) (reverse-rec (- n 1)))))
  (reverse-rec (- (length l) 1)))

(provide reverse)
