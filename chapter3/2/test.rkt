#lang racket

(require rackunit
	 "./2.rkt")

(define s (make-monitored sqrt))

(check-equal? (s 100) 10 "function was not called")
(check-equal? (s 25) 5 "function was not called")
(check-equal? (s 'how-many-calls?) 2 "wrong number of calls")
(s 'reset-count)
(check-equal? (s 121) 11 "function was not called")
(check-equal? (s 'how-many-calls?) 1 "wrong number of calls")
