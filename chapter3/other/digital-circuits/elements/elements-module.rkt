#lang racket

(require "../delays.rkt"
         "../wires/wires-module.rkt"
         "../agenda/agenda-module.rkt")

; copied from 3.28 in order to preserve relative paths

(define (or-gate a1 a2 output)
  (define (logical-or a1 a2)
    (if (or (= a1 1) (= a2 1)) 1 0))
  (define (or-action-procedure)
    (let ((new-value (logical-or (get-signal a1) (get-signal a2))))
        (after-delay or-gate-delay
                     (lambda () (set-signal! output new-value)))))
  (add-action! a1 or-action-procedure)
  (add-action! a2 or-action-procedure))

(define (inverter a output)
  (define (logical-not n)
    (if (= n 1) 0 1))
  (define (inverter-action-procedure)
    (let ((new-value (logical-not (get-signal a))))
      (after-delay inverter-delay
                   (lambda () (set-signal! output new-value)))))
  (add-action! a inverter-action-procedure))

(define (and-gate a1 a2 output)
  (define (logical-and n1 n2)
    (if (and (= n1 1) (= n2 1)) 1 0))
  (define (and-gate-action-procedure)
    (let ((new-value (logical-and (get-signal a1) (get-signal a2))))
      (after-delay and-gate-delay
                   (lambda () (set-signal! output new-value)))))
  (add-action! a1 and-gate-action-procedure)
  (add-action! a2 and-gate-action-procedure))

(define (half-adder a b s c)
  (let ((d (make-wire))
        (e (make-wire)))
    (or-gate a b d)
    (and-gate a b c)
    (inverter c e)
    (and-gate d e s)
    'ok))

(define (full-adder a b c-in sum c-out)
  (let ((s (make-wire))
        (c1 (make-wire))
        (c2 (make-wire)))
    (half-adder b c-in s c1)
    (half-adder a s sum c2)
    (or-gate c1 c2 c-out)
    'ok))

(provide inverter
         and-gate
         half-adder
         full-adder)
