#lang racket

(define (split combine combine-rec)
  (lambda (painter n)
    (if (= n 0)
      painter
      (let ((smaller ((split combine combine-rec) (- n 1))))
	(combine painter (combine-rec smaller smaller))))))

(provide split)
