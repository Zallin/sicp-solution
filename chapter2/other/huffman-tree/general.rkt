#lang racket

(define (make-leaf sym weight)
    (list 'leaf sym weight))

(define (leaf? object)
    (eq? (car object) 'leaf))

(define (symbol-leaf leaf)
    (cadr leaf))

(define (weight-leaf leaf)
    (caddr leaf))

(define (make-code-tree left right)
    (list left
	  right
	  (append (symbols left) (symbols right))
	  (+ (weight left) (weight right))))

(define (left-branch tree)
    (car tree))

(define (right-branch tree)
    (cadr tree))

(define (symbols tree)
    (if (leaf? tree)
            (list (symbol-leaf tree))
	          (caddr tree)))

(define (weight tree)
    (if (leaf? tree)
            (weight-leaf tree)
	          (cadddr tree)))

(provide make-leaf
	 leaf?
	 symbol-leaf
	 weight-leaf
	 make-code-tree
	 left-branch
	 right-branch
	 symbols
	 weight)
