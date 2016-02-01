#lang racket

(define (make-monitored f)
  (let ((number-of-calls 0))
    (define (increment-number)
      (set! number-of-calls (+ number-of-calls 1)))
    (define (reset-number)
      (set! number-of-calls 0))
    (define (dispatch arg)
      (cond ((eq? arg 'how-many-calls?) number-of-calls)
	    ((eq? arg 'reset-count) (reset-number))
	    (else (increment-number) (f arg))))
    dispatch))

(provide make-monitored)
