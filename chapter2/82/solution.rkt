#lang racket

(define (try-convert arg type)
  (let ((proc (get-coercion arg type)))
    (if proc 
      (proc arg)
      arg)))

(define (try-coercion op args types)
  (if (null? types)
    (error "no method for these types")
    (let ((new-args (map 
		      (lambda (arg) (try-convert arg (car types))) 
		      args)))
      (let ((proc (get op new-args)))
	(if proc
	  (apply proc (map contents new-args))
	  (try-coercion op args (cdr types)))))))

(define (apply-generic op . args)
  (let ((type-tags (map type-tag args)))
    (let ((proc (get op type-tags)))
      (if proc
	(apply proc (map contents args))
	(try-coercion op args type-tags)))))
