#lang racket

(require "../18/solution.rkt")

(define (deep-reverse l)
  (cond ((not (pair? l)) l)
        (else (reverse (map deep-reverse l)))))

(provide deep-reverse)
