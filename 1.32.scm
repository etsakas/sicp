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

(define (accumulate combiner null-value term a next b)
  (if (> a b)
      null-value
      (combiner (term a)
                (accumulate combiner null-value term (next a) next b))))

(define (product term a next b)
  (accumulate * 1 term a next b))

(define (sum term a next b)
  (accumulate + 0 term a next b))


(define (accumulate-iter combiner null-value term a next b)
  (define (accumulate-iter-aux a result)
    (if (> a b)
        result
        (accumulate-iter-aux (next a) (combiner (term a) result))))
  (accumulate-iter-aux a null-value))

(define (product-iter term a next b)
  (accumulate-iter * 1 term a next b))

(define (sum-iter term a next b)
  (accumulate-iter + 0 term a next b))

;;;;;;;;; testing ;;;;;;;;;;;;;;;

(define (factorial n)
  (define (inc x)
    (+ x 1))
  (define (identity x)
    x)

  (product identity 1 inc n))

(factorial 6)

(define (pi-sum a b)
  (define (pi-term x)
    (/ 1.0 (* x (+ x 2))))
  (define (pi-next x)
    (+ x 4))
  (sum pi-term a pi-next b))

(* 8 (pi-sum 1 1000))
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(define (factorial-iter n)
  (define (inc x)
    (+ x 1))
  (define (identity x)
    x)

  (product-iter identity 1 inc n))

(factorial-iter 6)

(define (pi-sum-iter a b)
  (define (pi-term x)
    (/ 1.0 (* x (+ x 2))))
  (define (pi-next x)
    (+ x 4))
  (sum-iter pi-term a pi-next b))

(* 8 (pi-sum-iter 1 1000))


