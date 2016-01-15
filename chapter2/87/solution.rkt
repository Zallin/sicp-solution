#lang racket

(define (=zero? poly)
  (let ((terms (term-list poly)))
    (empty-termlist? terms)))

(put '=zero? '(polynomial) =zero?)
