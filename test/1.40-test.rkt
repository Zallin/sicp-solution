#lang racket

(require rackunit
         "../other/newtons-method.rkt"
         "../chapter1/1.40.rkt")

(check-equal? (newtons-method (cubic 1 2 2) 0.5) -1.0000000309056447 "root of cubic eq with a=1, b=2, c=2 is wrong")
(check-equal? (newtons-method (cubic 4 3 2) 1) -3.2695308656969826 "root of cubic eq with a=4, b=3, c=2 is wrong")
(check-equal? (newtons-method (cubic 0 2 6) 2) -1.4561644925361397 "root of cubic eq with a=0, b=2, c=6 is wrong")
