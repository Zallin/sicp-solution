#lang racket

(define (pascal-triangle row col)
  (cond ((or (> col row) (< col 1)) 0)
        ((= col 1) 1)
        (else (+ (pascal-triangle (- row 1) (- col 1))
                 (pascal-triangle (- row 1) col)))))

(provide pascal-triangle)
