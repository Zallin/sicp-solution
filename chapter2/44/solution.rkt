#lang racket

(define (up-split pointer n)
  (if (= n 0)
    painter
    (let ((smaller (up-split pointer (- n 1))))
      (below pointer (beside smaller smaller)))))

(provide up-split)
