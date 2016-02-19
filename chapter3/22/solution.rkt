#lang racket

(define (make-queue)
  (let ((front-ptr '())
	(rear-ptr '()))
    (define (dispatch m)
      (cond ((eq? m 'front-ptr) front-ptr)
	    ((eq? m 'rear-ptr) rear-ptr)
	    ((eq? m 'set-front-ptr!)
	     (lambda (new-value) (set! front-ptr new-value)))
	    ((eq? m 'set-rear-ptr!)
	     (lambda (new-value) (set! rear-ptr new-value)))
	    (else (error "error - unknown operation"))))
    dispatch))

(define (front-ptr q)
  (q 'front-ptr))

(define (rear-ptr q)
  (q 'rear-ptr))

(define (set-front-ptr! q val)
  ((q 'set-front-ptr!) val))

(define (set-rear-ptr! q val)
  ((q 'set-rear-ptr!) val))

; since pointers manipulation procedures are properly defined
; we can copy definition of queue operations from the book
; without changes

(define (empty-queue? queue)
  (null? (front-ptr queue)))

(define (front-queue queue)
  (if (empty-queue? queue)
    (error "error - queue is empty")
    (mcar (front-ptr queue))))

(define (insert-queue! queue item)
  (let ((new-pair (mcons item '())))
    (cond ((empty-queue? queue)
	   (set-front-ptr! queue new-pair)
	   (set-rear-ptr! queue new-pair)
	   queue)
	  (else 
	    (set-mcdr! (rear-ptr queue) new-pair)
	    (set-rear-ptr! queue new-pair)
	    queue))))

(define (delete-queue! queue)
  (cond ((empty-queue? queue)
	 (error "error - queue is empty"))
	(else (set-front-ptr! queue (mcdr (front-ptr queue)))
	      queue)))
	 
(provide make-queue
	 empty-queue?
	 front-queue
	 insert-queue!
	 delete-queue!)
      
	
