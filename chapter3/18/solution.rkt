#lang racket

(require scheme/mpair)

(define (has-loop? lst)
  (define (pair-index lst part)
    (if (eq? lst part)
        0
        (+ 1 (pair-index (mcdr lst) part))))
  (define (has-loop-inner part)
    (cond ((null? part) false)
          ((> (pair-index lst part) (pair-index lst (mcdr part))) true)
          (else (has-loop-inner (mcdr part)))))
  (has-loop-inner lst))

(provide has-loop?)
