#lang racket

(define (fast-expt b n)

  ; Auxiliary procedures

  (define (square x)(* x x))
  (define (is-even? a)(= (remainder a 2) 0))

  ; recursive procedure that determines iterative process

  (define (iter b n a)
    (cond ((= n 0) a)
          ((is-even? n) (iter (square b) (/ n 2) a))
          (else (iter b (- n 1) (* a b)))))

  ; initial invocation

  (iter b n 1))

(provide fast-expt)
