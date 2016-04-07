#lang racket

(require data/queue
         scheme/mpair)

(define the-agenda '())

(define (after-delay delay proc)
  (add-to-agenda! (+ delay (current-time the-agenda))
                     proc
                     the-agenda))

(define (propagate)
  (if (empty-agenda?)
    'ok
    (let ((proc (first-agenda-item! the-agenda)))
      (proc)
      (propagate))))

(define (make-agenda)
  (set! the-agenda (mlist 0)))

(define (current-time agenda)
  (mcar agenda))

(define (set-current-time! agenda time)
  (set-mcar! agenda time))

(define (segments agenda)
  (mcdr agenda))

(define (first-segment agenda)
  (mcar (segments agenda)))

(define (rest-segments agenda)
  (mcdr (segments agenda)))

(define (set-segments! agenda segments)
  (set-mcdr! agenda segments))

(define (empty-agenda?)
  (null? (segments the-agenda)))

(define (make-time-segment time queue)
  (cons time queue))

(define (segment-time segment)
  (car segment))

(define (segment-queue segment)
  (cdr segment))

(define (first-agenda-item! agenda)
  (if (empty-agenda?)
    (error "agenda is empty -- first-agenda-item")
    (let ((first-seg (first-segment agenda)))
      (set-current-time! agenda (segment-time first-seg))
      (let ((first-item (dequeue! (segment-queue first-seg))))
        (if (queue-empty? (segment-queue first-seg))
          (set-segments! agenda (rest-segments agenda))
          '())
          first-item))))

(define (add-to-agenda! time proc agenda)
  (define (make-new-time-segment time proc)
    (let ((queue (make-queue)))
      (enqueue! queue proc)
      (make-time-segment time queue)))
  (define (belongs-before? segments)
    (or (null? segments)
      (< time
         (segment-time (mcar segments)))))
  (define (add-to-segments! segments)
    (if (= (segment-time (mcar segments)) time)
      (enqueue! (segment-queue (mcar segments))
                proc)
      (let ((rest (mcdr segments)))
        (if (belongs-before? rest)
          (set-mcdr! segments (mcons (make-new-time-segment time proc)
                                     rest))
          (add-to-segments! (mcdr segments))))))
  (let ((segments (segments agenda)))
    (if (belongs-before? segments)
      (set-segments! agenda (mcons (make-new-time-segment time proc)
                                   segments))
      (add-to-segments! segments))))

(provide propagate
         make-agenda
         after-delay
         empty-agenda?)
