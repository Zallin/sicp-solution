#lang racket

; import prime? procedure from ex. 1.28

(require "../28/solution.rkt")

; filtered-accumulate iterative procedure

(define (filtered-accumulate predicate combiner null-value term a next b)

  (define (iter a result)
    (if (> a b)
        result
        (if (predicate a)
            (iter (next a) (combiner result (term a)))
            (iter (next a) result))))

   (iter a null-value))

; shared next procedure

(define (next a) (+ a 1))

(define (sum-of-prime-squares a b)

  (define (square a) (* a a))
  (define (combiner a b) (+ a b))
  (define (predicate a)
    (if (< a 2)
        #f
        (prime? a)))

  (filtered-accumulate predicate + 0 square a next b))

(define (product-of-coprimes n)

  (define (predicate a)
    (define (gcd a b)
      (if (= b 0)
          a
          (gcd b (remainder a b))))
    (= (gcd n a) 1))

  (define (identity a) a)

  (filtered-accumulate predicate * 1 identity 2 next (- n 1)))

(provide sum-of-prime-squares
         product-of-coprimes)
