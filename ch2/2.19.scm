#lang sicp

(define us-coins (list 50 25 10 5 1))
(define uk-coins (list 100 50 20 10 5 2 1 0.5))

(define (cc amount coin-values)
  (cond ((= amount 0) 1)
        ((or (< amount 0) (no-more? coin-values)) 0)
        (else
         (+ (cc amount
                (except-first-denomination coin-values))
            (cc (- amount
                   (first-denomination coin-values))
                coin-values)))))

(define (first-denomination ls) (car ls))

(define (except-first-denomination ls) (cdr ls))

(define (no-more? ls)
  (if (null? ls)
      #t
      #f))

(cc 100 us-coins)

; the order in the coin list doesn't matter because the program check every possible combination of coins