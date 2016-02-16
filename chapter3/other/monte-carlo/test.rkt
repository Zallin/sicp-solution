#lang racket

(require rackunit
         "./monte-carlo.rkt")

(define (half-predicate-generator initial)
  (lambda ()
    (set! initial (not initial))
    initial))

(define half-predicate (half-predicate-generator true))

(check-equal? (monte-carlo 1 (lambda () false)) 0 "monte-carlo with false predicate failed")
(check-equal? (monte-carlo 1 (lambda () true)) 1 "monte-carlo with true predicate failed")
(check-equal? (monte-carlo 2 half-predicate) 1/2 "monte-carlo with half-predicate failed")
