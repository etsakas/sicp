#lang sicp

(define (cube x) (* x x x))
(define (even? n)
  (= (remainder n 2) 0))

(define (sum term a next b)
  (if (> a b)
      0
      (+ (term a)
         (sum term (next a) next b))))

(define (simpson f a b n)
  (define h (/ (- b a) n))
  (define (xk k) ; f's argument
    (+ a (* k h)))
  (define (inc x)
    (+ x 1))
  (define (yk k)
    (f (xk k)))
  (define (term k)
    (cond ((or (= k 1) (= k n)) (yk k))
          ((even? k) (* 2 (yk k)))
          (else (* 4 (yk k)))))
  
  (* (/ h 3.0) (sum term 0 inc n)))

(define (integral f a b dx)
  (define (add-dx x) (+ x dx))
  (* (sum f (+ a (/ dx 2.0)) add-dx b)
     dx))

(simpson cube 0 1 1000.0)
(integral cube 0 1 0.0001)

;0.24999999999900027
;0.24999999874993412