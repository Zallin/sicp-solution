#lang racket

(require rackunit
	 "./solution.rkt")

; random number tests

(check-equal? (prime? 5851) #t "test for 5851 failed")
(check-equal? (prime? 127) #t "test for 127 failed")
(check-equal? (prime? 98) #f "test for 98 failed")
(check-equal? (prime? 7752) #f "test for 7752 failed")

; carmichael numbers tests

(check-equal? (prime? 561) #f "Carmichael 561 failed")
(check-equal? (prime? 1105) #f "Carmichael 1105 failed")
(check-equal? (prime? 1729) #f "Carmichael 1729 failed")
(check-equal? (prime? 2465) #f "Carmichael 2465 failed")
(check-equal? (prime? 2821) #f "Carmichael 2821 failed")
(check-equal? (prime? 6601) #f "Carmichael 6601 failed")
