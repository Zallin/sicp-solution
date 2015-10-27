#lang racket

(require "../other/accumulate/accumulate.rkt")

(define (accumulate-n op initial seqs)
  (if (null? (car seqs))
    '()
    (cons (accumulate op initial (accumulate (lambda (x y)
					       (append (list (car x)) y))
					     '()
					     seqs))
	  (accumulate-n op initial (accumulate (lambda (x y)
						 (append (list (cdr x)) y))
					       '()
					       seqs)))))

(provide accumulate-n)
