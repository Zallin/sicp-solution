#lang racket

(require "../68/solution.rkt"
	 "../69/solution.rkt")

(define pairs (list (list 'A 2) (list 'BOOM 1) (list 'GET 2) (list 'JOB 2) (list 'NA 16) (list 'SHA 3) (list 'YIP 9) (list 'WAH 1)))

(define huffman-tree (generate-huffman-tree pairs))

(define message '(GET A JOB SHA NA NA NA NA NA NA NA NA GET A JOB SHA NA NA NA NA NA NA NA NA WAH YIP YIP YIP YIP YIP YIP YIP YIP YIP SHA BOOM))

(define encoded (encode message huffman-tree))

; number of bits required by huffman algorithm

(display (length encoded))
(display "\n")

; number of bits required by fixed-length encoding

(display (* (length message) 3))
(display "\n")
