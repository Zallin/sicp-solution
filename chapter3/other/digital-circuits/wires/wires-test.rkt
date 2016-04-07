#lang racket

(require rackunit
         "./module.rkt")

(define wire (make-wire))
(define called false)

(check-equal? (get-signal wire) 0 "get signal test 1 failed")
(set-signal! wire 1)
(check-equal? (get-signal wire) 1 "get signal test 2 failed")
(add-action! wire (lambda () (set! called true)))
(check-equal? called true "add action test 1 failed")
(set! called false)
(set-signal! wire 0)
(check-equal? called true "add action test 2 failed")
