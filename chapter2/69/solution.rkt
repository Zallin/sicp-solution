#lang racket

(require "../other/huffman-tree/general.rkt")

(define (successive-merge leaf-set)
  (if (null? (cdr leaf-set))
    (car leaf-set)
    (let ((left (car leaf-set))
	  (right (cadr leaf-set))
	  (other (cddr leaf-set)))
      (successive-merge (adjoin-set 
			  (make-code-tree left right)
			  other)))))

(define (generate-huffman-tree pairs)
  (successive-merge (make-leaf-set pairs)))

(provide generate-huffman-tree)
