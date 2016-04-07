#lang racket

(define (call-each proc-list)
  (if (null? proc-list)
      'ok
      (begin ((car proc-list))
             (call-each (cdr proc-list)))))

(define (make-wire)
  (let ((signal-value 0)
        (action-procedures '()))
    (define (set-signal! new-value)
      (if (not (= signal-value new-value))
        (begin (set! signal-value new-value)
               (call-each action-procedures))
        'ok))
    (define (accept-action-procedure proc)
      (set! action-procedures (cons proc action-procedures))
      (proc))
    (define (dispatch m)
      (cond ((eq? m 'get-signal) signal-value)
            ((eq? m 'set-signal!) set-signal!)
            ((eq? m 'add-action!) accept-action-procedure)
            (else (error "unknown procedure -- wire"))))
    dispatch))

(define (get-signal wire)
  (wire 'get-signal))

(define (set-signal! wire new-value)
  ((wire 'set-signal!) new-value))

(define (add-action! wire action-procedure)
  ((wire 'add-action!) action-procedure))

(provide make-wire
         get-signal
         set-signal!
         add-action!)
