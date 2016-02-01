#lang racket

(require rackunit 
	 "./3.rkt")

(define acc (make-account 100 'pass))

(check-equal? ((acc 'pass 'withdraw) 40) 60 "witdraw op test failed")
(check-equal? ((acc 'pass 'deposit) 40) 100 "deposit op test failed")
(check-equal? ((acc 'word 'withdraw) 100) "wrong password" "password check failed")
(check-equal? ((acc 'word 'deposit) 100) "wrong password" "password check failed")
