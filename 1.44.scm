#lang sicp

(define (smooth f dx)
  (lambda (x) (/ (+ (f x) (f (+ x dx)) (f (- x dx))) 3.0)))

(define (compose f g)
  (lambda (x) (f (g x))))

; n>=1
(define (repeated f n)
  (if (= n 1)
      f
      (compose (repeated f (- n 1)) f)))

(define (n-fold-smooth f dx n)
  (repeated (smooth f dx) n))