#lang racket

(require rackunit
         "../other/digital-circuits/agenda/agenda-module.rkt"
         "../other/digital-circuits/wires/wires-module.rkt"
         "./solution.rkt")

(make-agenda)
(define a1 (make-wire))
(define a2 (make-wire))
(define output (make-wire))
(or-gate a1 a2 output)
(propagate)
(check-equal? (get-signal output) 0 "or gate false test failed")
(set-signal! a1 1)
(propagate)
(check-equal? (get-signal output) 1 "or gate true test 1 failed")
(set-signal! a1 0)
(set-signal! a2 1)
(propagate)
(check-equal? (get-signal output) 1 "or gate true test 2 failed")
(set-signal! a1 1)
(propagate)
(check-equal? (get-signal output) 1 "or gate true test 3 failed")
