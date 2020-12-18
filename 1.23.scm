#lang sicp

(define (smallest-divisor n)
  (find-divisor n 2))

(define (devides? a b) (= (remainder b a) 0))

(define (square x) (* x x))

(define (prime? n)
  (= n (smallest-divisor n)))

(define (timed-prime-test n)
  (newline)
  (display n)
  (start-prime-test n (runtime)))

(define (start-prime-test n start-time)
  (if (prime? n)
      (report-prime (- (runtime) start-time))))

(define (report-prime elapsed-time)
  (display " *** ")
  (display elapsed-time))

(define (next x)
  (if (= x 2)
      3
      (+ x 2)))

(define (find-divisor n test-divisor)
  (cond ((> (square test-divisor) n) n)
        ((devides? test-divisor n) test-divisor)
        (else (find-divisor n (next test-divisor)))))


(timed-prime-test 199) ; 199 (prime)
(timed-prime-test 1999) ; 1999 (prime)
(timed-prime-test 19999) ; 7 (not prime)