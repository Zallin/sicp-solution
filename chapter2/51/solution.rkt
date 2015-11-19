#lang racket

(define (below-first p1 p2)
  (let ((split-point (make-vect 0 0.5)))
    (let ((paint-upper
	     (transform-painter p2
				split-point
				(make-vect 1.0 0.5)
				(make-vect 0 1.0)))
	   (paint-lower 
	     (transform-painter p1
				(make-vect 0 0)
				(make-vect 1.0 0)
				split-point)))
      (lambda (frame)
	(paint-upper frame)
	(paint-lower frame)))))
 
(define (below-second p1 p2)
  (rotate90 (beside (rotate270 p1) (rotate270 p2))))
