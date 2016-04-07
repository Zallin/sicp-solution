#lang racket

(require "../other/digital-circuits/wires/wires-module.rkt"
         "../other/digital-circuits/elements/elements-module.rkt")

(define (ripple-carry-adder a-list b-list s-list c)
  (cond ((null? a-list) '())
        (else (let ((c-out (make-wire)))
                (full-adder (car a-list) (car b-list) c (car s-list) c-out)
                (ripple-carry-adder (cdr a-list) (cdr b-list) (cdr s-list) c-out)))))

(provide ripple-carry-adder)
