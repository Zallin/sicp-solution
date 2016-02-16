#lang racket

(define (count-pairs lst)
  (let ((cache '()))
    (define (in-cache? cache val)
      (cond ((null? cache) false)
            ((eq? (car cache) val) true)
            (else (in-cache? (cdr cache) val))))
    (define (count-pairs-inner lst)
      (cond ((not (pair? lst)) 0)
            ((in-cache? cache lst) 0)
            (else (begin (set! cache (cons lst cache))
                         (+ (count-pairs-inner (car lst))
                            (count-pairs-inner (cdr lst))
                            1)))))
  (count-pairs-inner lst)))

(provide count-pairs)
