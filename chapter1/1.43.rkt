#lang racket

(define (repeated f times)

  (define (iter times product)
    (if (= times 0)
        product
        (iter (- times 1) (f product))))
        
  (lambda (x) (iter times x)))

(provide repeated)
