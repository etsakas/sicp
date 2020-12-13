#lang sicp
(define (square x) (* x x))
(define (sumOfSquares a b)(+ (square a) (square b)))

(define (so2l a b c)
  (cond ((and (>= a c) (>= b c)) (sumOfSquares a b))
        ((and (>= c a) (>= b a)) (sumOfSquares c b))
        ((and (>= a b) (>= c b)) (sumOfSquares a c))))

(so2l 1 2 3)
(so2l 3 2 1)
(so2l 3 1 2)