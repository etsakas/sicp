#lang sicp

(define (find-divisor n test-divisor)
  (cond ((> (square test-divisor) n) n)
        ((devides? test-divisor n) test-divisor)
        (else (find-divisor n (+ test-divisor 1)))))

(define (devides? a b) (= (remainder b a) 0))

(define (square x) (* x x))

(define (smallest-divisor n)
  (find-divisor n 2))

(smallest-divisor 199) ; 199 (prime)
(smallest-divisor 1999) ; 1999 (prime)
(smallest-divisor 19999) ; 7 (not prime)