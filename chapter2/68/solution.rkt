#lang racket

(require "../other/huffman-tree/general.rkt")

(define (contains-symbol? symbol seq)
  (cond ((null? seq) false)
	((eq? symbol (car seq)) true)
	(else (contains-symbol? symbol (cdr seq)))))

(define (encode message tree)
  (if (null? message)
    '()
    (append (encode-symbol (car message) tree)
	    (encode (cdr message) tree))))

(define (encode-symbol symbol tree)
  (define (encode-1 current-branch)
    (if (leaf? current-branch)
      '()
      (let ((next (next-branch symbol current-branch)))
	(cons (car next)
	      (encode-1 (cdr next))))))
  (if (contains-symbol? symbol (symbols tree))
    (encode-1 tree)
    (error "there is no such symbol in the tree")))

(define (next-branch symbol tree)
  (if (contains-symbol? symbol (symbols (left-branch tree)))
    (cons 0 (left-branch tree))
    (cons 1 (right-branch tree))))
    
(provide encode)

