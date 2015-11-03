#lang racket

(require "../other/accumulate/accumulate.rkt")

(define fold-right accumulate)

(define (fold-left op initial seq)
  (define (iter result sequence)
    (if (null? sequence)
      result
      (iter (op result (car sequence))
	    (cdr sequence))))
  (iter initial seq))

(define (reverse-right seq)
  (fold-right (lambda (x y) (append y (list x))) '() seq))

(define (reverse-left seq)
  (fold-left (lambda (x y) (append (list y) x)) '() seq))

(provide reverse-right
	 reverse-left)
