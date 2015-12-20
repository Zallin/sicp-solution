#lang racket

(require rackunit
	 "../other/huffman-tree/general.rkt"
	 "./solution.rkt")

(define sample-tree
    (make-code-tree (make-leaf 'A 4)
		    (make-code-tree
		      (make-leaf 'B 2)
		      (make-code-tree (make-leaf 'D 1)
				      (make-leaf 'C 1)))))

(define sample-message '(0 1 1 0 0 1 0 1 0 1 1 1 0))

(check-equal? (encode '(A D A B B C A) sample-tree) sample-message "encoding of sample message failed")
