#lang racket

(require rackunit
         "./solution.rkt")

(check-equal? (cont-frac-rec (lambda (i) 2.0)
                         (lambda (i) 2.0)
                         3)  0.75 "continued fraction with ni=2, di=2 failed")

(check-equal? (cont-frac-rec (lambda (i) 1.0)
                             (lambda (i) 1.0)
                             5) 0.625 "continued fraction with ni=1, di=2 failed")

(check-equal? (cont-frac-iter (lambda (i) 2.0)
                         (lambda (i) 2.0)
                         3)  0.75 "continued fraction with ni=2, di=2 failed")

(check-equal? (cont-frac-rec (lambda (i) 1.0)
                             (lambda (i) 1.0)
                             5) 0.625 "continued fraction with ni=1, di=2 failed")
