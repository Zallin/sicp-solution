#lang racket

(require rackunit
         "./solution.rkt")

(check-equal? (e-approx 10) 2.7182817182817183 "e approximation for 10 terms of fcf failed")
(check-equal? (e-approx 15) 2.718281828470584 "e approximation for 10 terms of fcf failed")
(check-equal? (e-approx 20) 2.718281828459045 "e approximation for 10 terms of fcf failed")
