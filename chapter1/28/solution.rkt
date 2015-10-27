#lang racket

(define (prime? n)

  (define (expmod base exp)
    (define (is-even? a) (= (remainder a 2) 0))

    ; modified "square" procedure that checks whether a non-trivial square root of 1 modulo n is found

    (define (square-check x)
      (if (and (not (= x 1)) (not (= x (- n 1))) (= (remainder (* x x) n) 1))
          0
          (remainder (* x x) n)))

    (cond ((= exp 0) 1)
          ((is-even? exp)
            (square-check (expmod base (/ exp 2))))
          (else (remainder (* base (expmod base (- exp 1))) n))))

  ; wrapper that invokes test several times

  (define (miller-rabin-test times)
    (cond ((= times 0) #t)
          ((= (expmod (+ 1 (random (- n 1))) (- n 1)) 1) (miller-rabin-test (- times 1)))
          (else #f)))

  (miller-rabin-test 5))

(provide prime?)
