#lang racket

(require rackunit
         "../other/digital-circuits/wires/wires-module.rkt"
         "../other/digital-circuits/agenda/agenda-module.rkt"
         "./solution.rkt")

(make-agenda)

(define (make-wires-list . numbers)
  (define (iter numbers result)
    (if (null? numbers)
      result
      (let ((new-wire (make-wire)))
        (set-signal! new-wire (car numbers))
        (iter (cdr numbers) (cons new-wire result)))))
  (iter numbers '()))

(define (wires-list->list wires-list)
  (if (null? wires-list)
    '()
    (cons (get-signal (car wires-list))
          (wires-list->list (cdr wires-list)))))

(define sum (make-wires-list 0 0 0))

(define (make-positive-wire)
  (let ((wire (make-wire)))
    (set-signal! wire 1)
    wire))

(ripple-carry-adder (make-wires-list 0 0 0) (make-wires-list 0 0 0) sum (make-wire))
(propagate)
(check-equal? (wires-list->list sum) (list 0 0 0) "ripple-carry-adder test 1 failed")
(ripple-carry-adder (make-wires-list 0 0 0) (make-wires-list 0 0 0) sum (make-positive-wire))
(propagate)
(check-equal? (wires-list->list sum) (list 1 0 0) "ripple-carry-adder test 2 failed")
(ripple-carry-adder (make-wires-list 1 1 1) (make-wires-list 0 0 0) sum (make-wire))
(propagate)
(check-equal? (wires-list->list sum) (list 1 1 1) "ripple-carry-adder test 3 failed")
(ripple-carry-adder (make-wires-list 0 0 0) (make-wires-list 1 1 1) sum (make-wire))
(propagate)
(check-equal? (wires-list->list sum) (list 1 1 1) "ripple-carry-adder test 4 failed")
(ripple-carry-adder (make-wires-list 1 0 1) (make-wires-list 0 0 0) sum (make-positive-wire))
(propagate)
(check-equal? (wires-list->list sum) (list 0 1 1) "ripple-carry-adder test 5 failed")
(ripple-carry-adder (make-wires-list 1 1 0) (make-wires-list 1 0 0) sum (make-positive-wire))
(propagate)
(check-equal? (wires-list->list sum) (list 1 0 1) "ripple-carry-adder test 6 failed")
(ripple-carry-adder (make-wires-list 0 1 0) (make-wires-list 0 1 1) sum (make-positive-wire))
(propagate)
(check-equal? (wires-list->list sum) (list 1 0 0) "ripple-carry-adder test 7 failed")
