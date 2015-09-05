#lang racket

(require rackunit
         "../chapter1/1.12.rkt")

(check-equal? (pascal-triangle 1 1) 1 "1, 1 test failed")
(check-equal? (pascal-triangle 16 1) 1 "16, 1 test failed")
(check-equal? (pascal-triangle 7 4) 20 "7, 4 test failed")
(check-equal? (pascal-triangle 5 5) 1 "5, 5 test failed")
