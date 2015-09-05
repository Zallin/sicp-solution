#lang racket

(require rackunit
          "../chapter1/1.7.rkt")

(check-equal? (sqrt-a 4) 2.0000000929222947 "Two params version test")
(check-equal? (sqrt-b 4) 2.0000000929222947 "One param version test")

(check-equal? (sqrt-a 0.000032341) 0.0057206509068391306 "Two params version test")
(check-equal? (sqrt-a 0.000032341) 0.0057206509068391306 "One param version test")

(check-equal? (sqrt-a 83764876348376438674) 9152315354.50874 "Two params version test")
(check-equal? (sqrt-a 83764876348376438674) 9152315354.50874 "One param version test")
