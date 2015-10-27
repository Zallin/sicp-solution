#lang racket

; iterative version of product procedure

(define (product-iter f a next b)
  (define (product-iter a result)
    (if (> a b)
        result
        (product-iter (next a) (* result (f a)))))
  (product-iter a 1))

; recursive version of product procedure

(define (product-rec f a next b)
  (if (> a b)
      1
      (* (f a) (product-rec f (next a) next b))))

(define (factorial x)

  (define (identity x) x)

  (define (next a)
    (+ a 1))

  (product-rec identity 1 next x))

(define (pi n)

  (define (odd? a) (= (remainder a 2) 1))

  (define (numerator k)
    (cond ((odd? k) (numerator (- k 1)))
          (else (+ k 2))))

  (define (denominator k)
    (if (odd? k)
        (+ k 2)
        (denominator (- k 1))))

  (define (next a)
    (+ a 1))

  (* 4.0 (/ (product-rec numerator 1 next n) (product-rec denominator 1 next n))))

(provide factorial pi)
