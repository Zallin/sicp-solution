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

(define (adjoin-set x seq)
  (cond ((null? seq) (list x))
	((< (weight x) (weight (car seq))) (cons x seq))
	(else (cons (car seq)
		    (adjoin-set x (cdr seq))))))

(define (make-leaf-set pairs)
  (if (null? pairs) 
    '()
    (let ((pair (car pairs)))
      (adjoin-set (make-leaf (car pair) (cadr pair))
		  (make-leaf-set (cdr pairs))))))

(provide make-leaf
	 leaf?
	 symbol-leaf
	 weight-leaf
	 make-code-tree
	 left-branch
	 right-branch
	 symbols
	 weight
	 adjoin-set
	 make-leaf-set)
