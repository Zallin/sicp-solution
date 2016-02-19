#lang racket

(define (make-account balance password)
  (let ((number-of-tries 0))
    (define (call-the-cops . args) "cops are on their way")
    (define (wrong-password . args) "wrong password")
    (define (increment-tries) (set! number-of-tries (+ number-of-tries 1)))
    (define (reset-tries) (set! number-of-tries 0))
    (define (withdraw amount)
      (if (>= balance amount)
	(begin (set! balance (- balance amount))
	       balance)
      "not enough money to withdraw"))
    (define (deposit amount)
      (set! balance (+ balance amount))
      balance)
    (define (dispatch pass op)
      (cond ((= number-of-tries 7) call-the-cops)
	    ((not (eq? password pass)) (increment-tries) wrong-password)
	    ((eq? op 'withdraw) (reset-tries) withdraw)
	    ((eq? op 'deposit) (reset-tries) deposit)
	    (else "Unknown operation")))
    dispatch))

(provide make-account)