#lang racket

(define (cont-frac-rec n d k)
  (if (= k 0)
      0
      (/ (n k) (+ (d k) (cont-frac-rec n d (- k 1))))))

(define (cont-frac-iter n d k)
  (define (iter k result)
    (if (= k 0)
        result
        (iter (- k 1) (/ (n k) (+ (d k) result)))))
  (iter k 0))

(provide cont-frac-rec
         cont-frac-iter)
