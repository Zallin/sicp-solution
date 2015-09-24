#lang racket

(define (gcd a b)
  (if (= b 0)
      a
      (gcd b (remainder a b))))

(define (make-rat num den)
  (let ((div (gcd (abs num) (abs den))))
    (if (< den 0)
        (cons (/ (* num -1) div) (/ (* den -1) div))
        (cons (/ num div) (/ den div)))))

(define (numer rat-number)
  (car rat-number))

(define (denom rat-number)
  (cdr rat-number))

(define (print-rat rat-number)
  (display (numer rat-number))
  (display "/")
  (display (denom rat-number))
  (newline))

(define (mul-rat x y)
  (make-rat (* (numer x) (numer y))
            (* (denom x) (denom y))))

(provide make-rat
         mul-rat
         print-rat)
