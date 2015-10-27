#lang racket

(define (for-each proc items)
  (map (lambda (x) (proc x) x)
        items))

(provide for-each)
