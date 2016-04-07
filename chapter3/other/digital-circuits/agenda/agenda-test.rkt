#lang racket

(require rackunit
         "./agenda-module.rkt")

(define invokation-list '())

(make-agenda)
(after-delay 2 (lambda () (set! invokation-list (cons 1 invokation-list))))
(after-delay 2 (lambda () (set! invokation-list (cons 2 invokation-list))))
(after-delay 3 (lambda () (set! invokation-list (cons 3 invokation-list))))
(after-delay 16 (lambda () (set! invokation-list (cons 4 invokation-list))))
(propagate)
(check-equal? invokation-list (list 4 3 2 1) "simple agenda test failed")
(check-equal? (empty-agenda?) true "empty agenda predicate test 1 failed")
(after-delay 2 (lambda () (set! invokation-list (cons 5 invokation-list))))
(after-delay 2 (lambda () (set! invokation-list (cons 6 invokation-list))))
(check-equal? (empty-agenda?) false "empty agenda predicate test 2 failed")
(after-delay 2 (lambda () (after-delay 5 (lambda () (set! invokation-list (cons 8 invokation-list))))))
(after-delay 3 (lambda () (set! invokation-list (cons 7 invokation-list))))
(after-delay 3 (lambda () (after-delay 4 (lambda () (set! invokation-list (cons 9 invokation-list))))))
(propagate)
(check-equal? invokation-list (list 9 8 7 6 5 4 3 2 1) "agenda test with function that updates agenda failed")
(check-equal? (empty-agenda?) true "empty agenda predicate test 3 failed")
