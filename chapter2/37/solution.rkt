#lang racket

(require "../other/accumulate/accumulate.rkt"
	 "../36/solution.rkt")

(define (dot-product v w)
  (accumulate + 0 (map * v w)))

(define (matrix-*-vector m v)
  (map (lambda (row) (dot-product row v)) m))

(define (transpose mat)
  (accumulate-n (lambda (x y) (cons x y)) '() mat))

(define (matrix-*-matrix m n)
  (let ((cols (transpose n)))
    (map (lambda (row)
	   (map (lambda (_ y)
		  (accumulate +
			      0
			      (map * row y))) 
		  row 
		  cols))
	 m)))

(provide matrix-*-vector
	 transpose
	 matrix-*-matrix)
