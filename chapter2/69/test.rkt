#lang racket

(require "../other/huffman-tree/general.rkt"
	 "./solution.rkt"
	 rackunit)

(define sample-tree (make-code-tree 
		      (make-leaf 'A 7)
		      (make-leaf 'B 10)))

(check-equal? (generate-huffman-tree (list (list 'B 10) (list 'A 7))) sample-tree "huffman tree generation failed")

(define pairs (list (list 'A 8) (list 'B 3) (list 'C 1) (list 'D 1) (list 'E 1) (list 'F 1) (list 'G 1) (list 'H 1)))

(define tree (generate-huffman-tree pairs))

(check-equal? (weight tree) 17 "generation test failed")
(check-equal? (symbol-leaf (left-branch tree)) 'A "generation test failed")
