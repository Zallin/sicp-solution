#lang racket

(define (sum term a next b)
  (if (> a b)
      0
      (+ (term a)
         (sum term (next a) next b))))

(define (simpsons-integral f a b n)

  (define h (/ (- b a) n))

  (define (next n)
    (+ n 1))

  (define (y k)
    (+ a (* k h)))

  (define (term k)
    (* (y k)
       (cond ((odd? k) 4)
             ((or (= k 0) (= k n)) 1)
             (else 2))))

  (* (/ h 3.0) (sum term 0 next n)))

(provide simpsons-integral)
