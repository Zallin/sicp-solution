#lang racket

(require rackunit
	 "./solution.rkt")

(check-equal? (count-leaves (list 1 2 3 4 5)) 5 "count-leaves of (1 2 3 4 5) failed")
(check-equal? (count-leaves (list 1 2 (list 3 4) (list 4 6) 1)) 7 "count-leaves of (1 2 (3 4) (4 6) 1) failed")
(check-equal? (count-leaves (list 1 (list 2 (list 3 (list 4))))) 4 "count-leaves of (1 (2 (3 (4)))) failed")
