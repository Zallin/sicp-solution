#lang racket

(define (same-parity? a b)
 (= (remainder a 2) (remainder b 2)))

(define (same-parity d . w)
  (define (iter l a)
    (if (null? l)
        a
        (iter (cdr l)
              (if (same-parity? d (car l))
                  (append a (list (car l)))
                  a))))
  (iter w (list d)))

(provide same-parity)
