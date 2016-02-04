#lang racket

(define (make-f)
  (let ((first-call false)
        (temp 0))
    (lambda (x)
      (if first-call
        (begin (set! temp first-call)
               (set! first-call false)
               temp)
        (begin (set! first-call x) 0)))))

(provide make-f)
