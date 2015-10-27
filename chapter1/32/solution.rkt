#lang racket

(define (accumulate-rec combiner null-value term a next b)
  (if (> a b)
      null-value
      (combiner (term a) (accumulate-rec combiner null-value term (next a) next b))))

(define (accumulate-iter combiner null-value term a next b)

  (define (iter a result)
    (if (> a b)
        result
        (iter (next a) (combiner result (term a)))))

  (iter a null-value))

; sum procedure implementation

(define (sum-combiner a b) (+ a b))

(define (sum-rec term a next b)
  (accumulate-rec sum-combiner 0 term a next b))

(define (sum-iter term a next b)
  (accumulate-iter sum-combiner 0 term a next b))

; product procedure implementation

(define (product-combiner a b) (* a b))

(define (product-rec term a next b)
  (accumulate-rec product-combiner 1 term a next b))

(define (product-iter term a next b)
  (accumulate-iter product-combiner 1 term a next b))


(provide sum-rec
         sum-iter
         product-rec
         product-iter)
