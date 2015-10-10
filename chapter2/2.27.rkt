#lang racket

(require "./2.18.rkt")

(define (deep-reverse l)
  (cond ((not (pair? l)) l)
        (else (reverse (map deep-reverse l)))))

(provide deep-reverse)
