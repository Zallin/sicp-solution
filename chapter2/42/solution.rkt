#lang racket

(require "../other/flatmap/flatmap.rkt"
	 "../other/enumerate-interval/enumerate-interval.rkt")

; position data type

(define (make-pos row col)
  (list row col))

(define (pos-row pos)
  (car pos))

(define (pos-col pos)
  (cadr pos))

; queens auxiliary procedures implementation

(define (adjoin-position row col rest-of-queens)
  (append rest-of-queens (list (make-pos row col))))

(define (safe? col positions-set)
  (define last-queen (list-ref positions-set (- col 1)))
  (define (iter positions)
    (let ((current-queen (car positions)))
      (cond ((= (pos-col current-queen) (pos-col last-queen)) true)
	    ((= (pos-row current-queen) (pos-row last-queen)) false)
	    ((= (abs (- (pos-row current-queen) (pos-row last-queen)))
		(abs (- (pos-col current-queen) (pos-col last-queen))))
	     false)
	    (else (iter (cdr positions))))))
  (iter positions-set))

(define empty-board '())

; quuens procedure from the exercise

(define (queens board-size)
  (define (queen-cols k)
    (if (= k 0)
      (list empty-board)
      (filter (lambda (positions) (safe? k positions))
	      (flatmap (lambda (rest-of-queens)
			 (map (lambda (new-row)
				(adjoin-position new-row k rest-of-queens))
			      (enumerate-interval 1 board-size)))
		       (queen-cols (- k 1))))))
  (queen-cols board-size))

(provide queens
	 adjoin-position
	 safe?)
