#lang racket

(require rackunit
         "./solution.rkt")

(check-equal? (tan-cf 10 100) 0.6483608274590866 "tan(10) failed")
(check-equal? (tan-cf 20 100) 2.2371609442247418 "tan(20) failed")
(check-equal? (tan-cf 45 100) 1.6197751905438595 "tan(45) failed")
