#lang racket

(require rackunit
	 "./solution.rkt")

(check-equal? (multiply 6 6) 36 "6*6 failed")
(check-equal? (multiply 5 3) 15 "5*3 failed")
(check-equal? (multiply 10 10) 100 "10*10 failed")
(check-equal? (multiply 3 0) 0 "3*0 failed")
(check-equal? (multiply 0 2) 0 "0*2 failed")
(check-equal? (multiply 7 6) 42 "7*6 failed")
