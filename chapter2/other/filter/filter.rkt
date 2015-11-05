#lang racket

(define (filter pred seq)
  (cond ((null? seq) '())
	((pred (car seq)) (cons (car seq) (filter pred (cdr seq))))
	(else (filter pred (cdr seq)))))

(provide filter)
