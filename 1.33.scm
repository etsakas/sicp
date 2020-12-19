#lang sicp

;(define (product term a next b)
;  (if (> a b)
;      1
;      (* (term a)
;         (product term (next a) next b))))
;
;(define (sum term a next b)
;  (if (> a b)
;      0
;      (+ (term a)
;         (sum term (next a) next b))))

(define (filtered-accumulate combiner null-value term a next b filter)
  (if (> a b)
      null-value
      (if (filter a)
          (combiner (term a) (filtered-accumulate combiner null-value term (next a) next b filter))
          (combiner null-value (filtered-accumulate combiner null-value term (next a) next b filter)))))

;;;;; testing: summing squares of prime numbers on a given ranger. Revisit 1.23

(define (devides? a b) (= (remainder b a) 0))
(define (square x) (* x x))

; nest procedures
(define (prime? n)
  (define (smallest-divisor n)
    (define (find-divisor n test-divisor)
      (define (next x)
        (if (= x 2)
            3
            (+ x 2)))
      (cond ((> (square test-divisor) n) n)
            ((devides? test-divisor n) test-divisor)
            (else (find-divisor n (next test-divisor)))))
    (find-divisor n 2))
  (= n (smallest-divisor n)))


(define (inc x) (+ x 1))
(filtered-accumulate + 0 square 2 inc 10 prime?)
(filtered-accumulate + 0 square 2 inc 3 prime?)

;;;;; testing: product of all integers less than n that are relatively prime to n (i<n such that gcd(i,n)

(define (gcd a b)
  (if (= b 0)
      a
      (gcd b (remainder a b))))

(define (identity x) x)

(define (product-of-coprimes n)
  (define (coprime? i)
    (if (= (gcd i n) 1)
        true
        false))
  (filtered-accumulate * 1 identity 1 inc (- n 1) coprime?))

(product-of-coprimes 5)

