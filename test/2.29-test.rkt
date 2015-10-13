#lang racket

(require rackunit
         "../chapter2/2.29.rkt")

(define left (make-branch 2 3))
(define right (make-branch 2 3))
(define mobile (make-mobile left right))
(define unbalanced-mobile (make-mobile (make-branch 2 5)
                                       (make-branch 1 7)))

(define big-unbalanced-mobile (make-mobile (make-branch 4 (make-mobile (make-branch 1 7)
                                                                       (make-branch 2 8)))
                                           (make-branch 6 (make-mobile (make-branch 5 2)
                                                                       (make-branch 1 6)))))

(define big-balanced-mobile (make-mobile (make-branch 4 (make-mobile (make-branch 3 2)
                                                                     (make-branch 3 2)))
                                         (make-branch 4 (make-mobile (make-branch 3 2)
                                                                     (make-branch 3 2)))))

(check-equal? (left-branch mobile) left "left branch selector test failed")
(check-equal? (right-branch mobile) right "right branch selector test failed")

(check-equal? (branch-length left) 2 "branch length selector test failed")
(check-equal? (branch-length right) 2 "branch length selector test failed")

(check-equal? (branch-structure left) 3 "branch structure selector test failed")
(check-equal? (branch-structure right) 3 "branch structure selector test failed")

(check-equal? (total-weight mobile) 6 "mobile weight test failed")
(check-equal? (total-weight unbalanced-mobile) 12 "mobile weight test failed")
(check-equal? (total-weight big-unbalanced-mobile) 23 "mobile weight test failed")

(check-equal? (mobile-balanced? mobile) true "failed to detect balanced mobile")
(check-equal? (mobile-balanced? unbalanced-mobile) false "failed to detect unbalanced mobile")
(check-equal? (mobile-balanced? big-unbalanced-mobile) false "failed to detect unbalanced mobile")
(check-equal? (mobile-balanced? big-balanced-mobile) true "failed to detect balanced mobile")
