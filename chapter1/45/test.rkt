#lang racket

(require rackunit
         "./solution.rkt"
         "../16/solution.rkt")

(check-equal? (root (fast-expt 2 2) 2) 2.0000000929222947 "square root of 4 failed")
(check-equal? (root (fast-expt 2 3) 3) 2.0002326972862416 "cubic root of 8 failed")
(check-equal? (root (fast-expt 2 4) 4) 2.0000000000021965 "4th root of 16 failed")
(check-equal? (root (fast-expt 2 6) 6) 2.000187828703668 "6th root of 64 failed")
(check-equal? (root (fast-expt 2 8) 8) 2.0000015055871168 "8th root 256 failed")
(check-equal? (root (fast-expt 2 15) 15) 1.9995622430182498 "15th root 32 768 failed")
(check-equal? (root (fast-expt 2 30) 30) 2.0004222797018008 "30th root 1 073 741 824 failed")
(check-equal? (root (fast-expt 2 40) 40) 2.00017807528984 "40th root 1 099 511 627 776 failed")
