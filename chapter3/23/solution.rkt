#lang racket

(require scheme/mpair)

(define (make-deque)
  (mcons '() '()))

(define (front-ptr deq)
  (mcar deq))

(define (rear-ptr deq)
  (mcdr deq))

(define (set-front-ptr! deq new-value)
  (set-mcar! deq new-value))

(define (set-rear-ptr! deq new-value)
  (set-mcdr! deq new-value))

; in order to adhere to data abstraction discipline
; let s assume that deque consists of elements
; that are made from value and references to prev and next element
; so we need to define constructor, selectors and mutators for this type

(define (make-deq-elem value next-el prev-el)
  (mlist value next-el prev-el))

(define (deq-elem-value el)
  (mcar el))

(define (deq-next-el el)
 (mcar (mcdr el)))

(define (deq-prev-el el)
 (mcar (mcdr (mcdr el))))

; value of element is never changed
; i think we might also define element of a deque as an qimmutable type
; and every time we change one of the references just create new element
; but this will probably lead to code redundancy

(define (deq-set-next-el! el new-ref)
  (set-mcar! (mcdr el) new-ref))

(define (deq-set-prev-el! el new-ref)
  (set-mcar! (mcdr (mcdr el)) new-ref))

; now we can define deque ops

(define (empty-deque? deq)
  (and (null? (front-ptr deq)) (null? (rear-ptr deq))))

(define (front-deque deq)
  (if (empty-deque? deq)
      '()
      (deq-elem-value (front-ptr deq))))

(define (rear-deque deq)
  (if (empty-deque? deq)
      '()
      (deq-elem-value (rear-ptr deq))))

(define (front-insert-deque! deq value)
  (let ((new-el (make-deq-elem value (front-ptr deq) '())))
        (cond ((empty-deque? deq)
               (set-front-ptr! deq new-el)
               (set-rear-ptr! deq new-el))
              (else (deq-set-prev-el! (front-ptr deq) new-el)
                    (set-front-ptr! deq new-el)))))

(define (rear-insert-deque! deq value)
  (let ((new-el (make-deq-elem value '() (rear-ptr deq))))
        (cond ((empty-deque? deq)
               (set-front-ptr! deq new-el)
               (set-rear-ptr! deq new-el))
              (else (deq-set-next-el! (rear-ptr deq) new-el)
                    (set-rear-ptr! deq new-el)))))

(define (front-delete-deque! deq)
  (cond ((empty-deque? deq)
         (error "deque is empty"))
        ((null? (deq-next-el (front-ptr deq)))
         (set-front-ptr! deq '())
         (set-rear-ptr! deq '()))
        (else (let ((next-front-el (deq-next-el (front-ptr deq))))
                    (deq-set-prev-el! next-front-el '())
                    (set-front-ptr! deq next-front-el)
                    deq))))

(define (rear-delete-deque! deq)
 (cond ((empty-deque? deq)
        (error "deque is empty"))
       ((null? (deq-prev-el (rear-ptr deq)))
        (set-front-ptr! deq '())
        (set-rear-ptr! deq '()))
       (else (let ((next-rear-el (deq-prev-el (rear-ptr deq))))
                    (deq-set-next-el! next-rear-el '())
                    (set-rear-ptr! deq next-rear-el)
                    deq))))

(provide make-deque
         empty-deque?
         front-deque
         rear-deque
         front-insert-deque!
         rear-insert-deque!
         front-delete-deque!
         rear-delete-deque!)
