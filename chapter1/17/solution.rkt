#lang racket

(define (multiply a b)

  ; procedures from task description

  (define (double a) (* 2 a))
  (define (halve a) (/ a 2))

  ; is-even procedure from fast-expt / 1.16

  (define (is-even? a) (= (remainder a 2) 0))

  ; recursive calls

  (cond ((= b 0) 0)
        ((is-even? b) (double (multiply a (halve b))))
        (else (+ a (multiply a (- b 1))))))

(provide multiply)
