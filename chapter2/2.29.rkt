#lang racket

(define (make-mobile left right)
  (list left right))

(define (make-branch len structure)
  (list len structure))

(define (left-branch m)
  (list-ref m 0))

(define (right-branch m)
  (list-ref m 1))

(define (branch-length b)
  (list-ref b 0))

(define (branch-structure b)
  (list-ref b 1))

(define (branch-weight b)
  (if (pair? (branch-structure b))
      (total-weight (branch-structure b))
      (branch-structure b)))

(define (total-weight m)
  (if (pair? m)
      (+ (branch-weight (left-branch m))
         (branch-weight (right-branch m)))
      m))

(define (torque b)
  (* (branch-length b) (total-weight (branch-structure b))))

(define (mobile-balanced? m)
  (if (pair? m)
    (and (= (torque (left-branch m))
            (torque (right-branch m)))
         (mobile-balanced? (branch-structure (left-branch m)))
         (mobile-balanced? (branch-structure (right-branch m))))
    true))

(provide make-mobile
         make-branch
         left-branch
         right-branch
         branch-length
         branch-structure
         total-weight
         mobile-balanced?)
