#lang racket

(require rackunit
         "../chapter1/1.8.rkt")

(check-equal? (croot 27) 3.0000000000000977 "croot 27")
(check-equal? (croot 0.000000003434125) 0.0018080714232713904 "croot of a little number")
