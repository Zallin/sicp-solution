#lang racket

(require scheme/mpair)

(define (has-loop? lst)
  (define (is-before? current-index expected-index current-list part)
    (cond ((= current-index expected-index) false)
	  ((eq? current-list part) true)
	  (else (is-before? (+ current-index 1)
			    expected-index
			    (mcdr current-list)
			    part))))
  (define (has-loop-inner list-part index)
    (cond ((null? list-part) false)
	  ((is-before? 0 index lst list-part) true)
	  (else (has-loop-inner (mcdr list-part)
				(+ index 1)))))
  (has-loop-inner (mcdr lst) 1))

(provide has-loop?)
