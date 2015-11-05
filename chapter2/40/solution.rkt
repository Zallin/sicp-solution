#lang racket

(require "../other/accumulate/accumulate.rkt"
	 math/number-theory)

(define (enumerate-interval low high)
  (if (> low high) 
    '()
    (cons low (enumerate-interval (+ low 1) high))))

(define (unique-pairs n)
  (accumulate append
	      '()
	      (map (lambda (i)
		     (map (lambda (j)
			    (list i j))
			  (enumerate-interval 1 (- i 1))))
		   (enumerate-interval 1 n))))

(define (make-pair-sum pair)
  (list (car pair) (cadr pair) (+ (car pair) (cadr pair))))

(define (prime-sum? pair)
  (prime? (+ (car pair) (cadr pair))))

(define (prime-sum-pairs n)
  (map make-pair-sum 
       (filter prime-sum?
	       (unique-pairs n))))

(provide unique-pairs
	 prime-sum-pairs)
