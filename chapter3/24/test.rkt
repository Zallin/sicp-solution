#lang racket

(require rackunit
         "./solution.rkt")

(define (same-key? k1 k2)
  (= k1 k2))
(define f-table (make-table same-key?))
((f-table 'insert-proc!) 1 2 'a)
((f-table 'insert-proc!) 2 1 'b)
(check-equal? ((f-table 'lookup-proc) 1 2) 'a "lookup test for keys 1, 2 failed")
(check-equal? ((f-table 'lookup-proc) 2 1) 'b "lookup test for keys 2, 1 failed")
(check-equal? ((f-table 'lookup-proc) 3 1) false "lookup test for keys 3, 1 failed")
(check-equal? ((f-table 'lookup-proc) 1 3) false "lookup test for keys 1, 3 failed")
((f-table 'insert-proc!) 1 2 'c)
(check-equal? ((f-table 'lookup-proc) 1 2) 'c "lookup test for keys 1, 2 failed")
