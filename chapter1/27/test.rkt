#lang racket

(require rackunit
	 "./solution.rkt")


; just random tests to ensure that procedure works properly

(check-equal? (fermat-test 17) #t "test for 17 failed")
(check-equal? (fermat-test 1361) #t "test for 1361 failed")
(check-equal? (fermat-test 20) #f "test for 20 failed")
(check-equal? (fermat-test 729) #f "test for 729 failed")

; exercise tests

(check-equal? (fermat-test 561) #t "Carmichael 561 failed")
(check-equal? (fermat-test 1105) #t "Carmichael 1105 failed")
(check-equal? (fermat-test 1729) #t "Carmichael 1729 failed")
(check-equal? (fermat-test 2465) #t "Carmichael 2465 failed")
(check-equal? (fermat-test 2821) #t "Carmichael 2821 failed")
(check-equal? (fermat-test 6601) #t "Carmichael 6601 failed")
