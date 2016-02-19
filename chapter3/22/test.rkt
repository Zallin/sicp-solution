#lang racket

(require rackunit
	 "./solution.rkt")

(define q (make-queue))
(check-equal? (empty-queue? q) true "empty queue predicate test failed")
(insert-queue! q 'a)
(check-equal? (empty-queue? q) false "empty queue predicate test failed")
(check-equal? (front-queue q) 'a "extraction of front element failed")
(insert-queue! q 'b)
(delete-queue! q)
(check-equal? (front-queue q) 'b "deletion of element failed")
(delete-queue! q)
(check-equal? (empty-queue? q) true "empty queue predicate test failed")
