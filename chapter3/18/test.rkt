#lang racket

(require scheme/mpair
         rackunit
         "./solution.rkt")

(define (mlast-pair lst)
  (if (null? (mcdr lst))
      lst
      (mlast-pair (mcdr lst))))

(define looped-list (mlist 'a 'b 'c 'd))
(set-mcdr! (mlast-pair looped-list) looped-list)

(check-equal? (has-loop? looped-list) true "failed to detect pair with loop")
(check-equal? (has-loop? (mlist 'a 'b 'c 'd)) false "failed to detect pair without loop")
