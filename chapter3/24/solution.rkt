#lang racket

(require scheme/mpair)

; since modern racket distinguishes between mutable and immutable pairs
; all pairs are mutable so we can use one procedure (assoc) for search

(define (make-table same-key?)
  (let ((local-table (mlist '*table*)))
    (define (assoc key record-list)
      (cond ((null? record-list) false)
            ((same-key? key (mcar (mcar record-list))) (mcar record-list))
            (else (assoc key (mcdr record-list)))))
    (define (lookup k1 k2)
      (let ((subtable (assoc k1 (mcdr local-table))))
        (if subtable
            (let ((record (assoc k2 (mcdr subtable))))
              (if record
                  (mcdr record)
                  false))
            false)))
    (define (insert! k1 k2 value)
      (let ((subtable (assoc k1 (mcdr local-table))))
        (if subtable
            (let ((record (assoc k2 (mcdr subtable))))
              (if record
                  (set-mcdr! record value)
                  (set-mcdr! subtable (mcons (mcons k2 value)
                                             (mcdr subtable)))))
            (set-mcdr! local-table (mcons (mlist k1 (mcons k2 value))
                                          (mcdr local-table))))
        value))
   (define (dispatch m)
    (cond ((eq? m 'lookup-proc) lookup)
          ((eq? m 'insert-proc!) insert!)
          (else (error "unknown operation"))))
   dispatch))

(provide make-table)
