#lang racket

(define (fermat-test n)

  ; expmod procedure from the original fermat-test with minor alterations

  (define (expmod base exp)
    (define (square x) (* x x))
    (define (is-even? a) (= (remainder a 2) 0))
    (cond ((= exp 0) 1)
          ((is-even? exp) (remainder (square (expmod base (/ exp 2))) n))
          (else (remainder (* base (expmod base (- exp 1))) n))))

  (define (try-it a)
    (= (expmod a n) a))

  ; does fermat-test for every a < n

  (define (iter a)
    (cond ((= a n) #t)
          ((try-it a) (iter (+ a 1)))
          (else #f)))

  (iter 2))

(provide fermat-test)
