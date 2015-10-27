#lang racket

(require "../37/solution.rkt")

(define (e-approx n)

  (define (d i)

    (define (find-k i k)
      (cond ((< i 0) -1)
            ((= i 2) k)
            (else (find-k (- i 3) (+ k 1)))))

    (let ((k (find-k i 0)))
      (cond ((< k 0) 1)
            (else (+ (* k 2) 2)))))

  (+ (cont-frac-iter (lambda (i) 1.0) d n) 2.0))

(provide e-approx)
