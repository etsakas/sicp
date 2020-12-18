#lang sicp

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

(define (smallest-divisor n)
  (find-divisor n 2))

(define (find-divisor n test-divisor)
  (cond ((> (square test-divisor) n) n)
        ((divides? test-divisor n) test-divisor)
        (else (find-divisor n (+ test-divisor 1)))))

(define (divides? a b)
  (= (remainder b a) 0))

(define (square x) (* x x))

(define (prime? n)
  (= n (smallest-divisor n)))

(define (even? n)
  (= (remainder n 2) 0))


(define (search-for-primes start end)
  (define (search-for-primes-aux start end)
    (if (<= start end)
        (timed-prime-test start))
    (if (<= start end)
        (search-for-primes-aux (+ start 2) end)))

  (if (even? start)
      (search-for-primes-aux (+ start 1) end)
      (search-for-primes-aux start end)))

(search-for-primes 1 199)