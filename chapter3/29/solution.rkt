#lang racket

(require "../other/digital-circuits/wires/wires-module.rkt"
         "../other/digital-circuits/elements/elements-module.rkt")

(define (or-gate a1 a2 output)
  (let ((inv-1 (make-wire))
        (inv-2 (make-wire))
        (and-1 (make-wire)))
    (inverter a1 inv-1)
    (inverter a2 inv-2)
    (and-gate inv-1 inv-2 and-1)
    (inverter and-1 output))
  'ok)

(provide or-gate)
