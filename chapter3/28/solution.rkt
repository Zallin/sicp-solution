#lang racket

(require "../other/digital-circuits/delays.rkt"
         "../other/digital-circuits/agenda/agenda-module.rkt"
         "../other/digital-circuits/wires/wires-module.rkt")

(define (logical-or a1 a2)
  (if (or (= a1 1) (= a2 1))
    1
    0))

(define (or-gate a1 a2 output)
  (define (or-action-procedure)
    (let ((new-value (logical-or (get-signal a1) (get-signal a2))))
      (after-delay or-gate-delay
                   (lambda () (set-signal! output new-value)))))
  (add-action! a1 or-action-procedure)
  (add-action! a2 or-action-procedure))

(provide or-gate)
