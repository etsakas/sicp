#lang sicp

(define (even? n)
  (= (remainder n 2) 0))

(define (product term a next b)
  (if (> a b)
      1
      (* (term a)
         (product term (next a) next b))))

(define (factorial n)
  (define (inc x)
    (+ x 1))
  (define (identity x)
    x)

  (product identity 1 inc n))

(factorial 6)

(define (pi-approx b) ; let b a parameter that controls pi's precision
  (define (next x)
    (+ x 2))
  (define (term x)
    (cond ((even? x) (* x (+ x 2)))
          (else (* x x))))
  (* 4.0 (/ (product term 2 next b) (product term 3 next (+ b 1)))))
; note that in order for the divisor to take the same number of terms as the divident
; with have to add one to b


;(pi-approx 8)
; same as (* 4.0 (/ (* 2 4 4 6 6 8 8 10) (* 3 3 5 5 7 7 9 9)))
(pi-approx 1000)

(define (product-iter term a next b)
  (define (product-iter-aux a product) ; here product is a number, not a procedure
    (if (> a b)
        product
        (product-iter-aux (next a) (* (term a) product))))
  
  (product-iter-aux a 1))


(define (factorial-iter n)
  (define (inc x)
    (+ x 1))
  (define (identity x)
    x)

  (product-iter identity 1 inc n))

(factorial-iter 6)


