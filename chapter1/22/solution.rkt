#lang racket

; auxiliary procedures

(define (square x) (* x x))

(define (is-even? a) (= (remainder a 2) 0))


; simple prime test procedure from the book

(define (divides? n a) (= (remainder n a) 0))

(define (smallest-divisor n)
  (find-divisor n 2))

(define (find-divisor n divisor)
  (cond ((> (square divisor) n) n)
        ((divides? n divisor) divisor)
        (else (find-divisor n (+ divisor 1)))))

(define (prime? n)
  (= (smallest-divisor n) n))

; timed prime test from exercise 1.22

(define (timed-prime-test n)
  (newline)
  (display n)
  (start-prime-test n (current-inexact-milliseconds)))

(define (start-prime-test n start-time)
  (cond ((prime? n)
      (report-prime (- (current-inexact-milliseconds) start-time)))))

(define (report-prime elapsed-time)
  (display " *** ")
  (display elapsed-time))

; search-for-primes implementation

(define (search-for-primes a b)
  (define (iter a b)
    (cond ((< a b) (timed-prime-test a) (iter (+ a 2) b))))
  (if (is-even? a) (iter (+ a 1) b) (iter a b)))
