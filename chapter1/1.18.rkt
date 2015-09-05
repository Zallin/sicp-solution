#lang racket

(define (multiply a b)

  ; auxiliary procedures from task description

  (define (double a) (* 2 a))
  (define (halve a) (/ a 2))

  ; is-even predicate from fast-expt / 1.16

  (define (is-even? a) (= (remainder a 2) 0))

  (define (iter a b c)
    (cond ((= b 0) c)
          ((is-even? b) (iter (double a) (halve b) c))
          (else (iter a (- b 1) (+ a c)))))

  (iter a b 0))

(provide multiply)
