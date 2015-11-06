#lang racket

(require "../accumulate/accumulate.rkt")

(define (flatmap proc seq)
  (accumulate append
	      '()
	      (map proc seq)))

(provide flatmap)
