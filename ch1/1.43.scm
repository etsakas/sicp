#lang sicp

(define (square x) (* x x))
;
;(define (repeated f n)
;  (if (= n 1)
;      f
;      (lambda (x) ((repeated f (- n 1)) (f x)))))

; better using 1.42's compose procedure

(define (compose f g)
  (lambda (x) (f (g x))))

; n>=1
(define (repeated f n)
  (if (= n 1)
      f
      (compose (repeated f (- n 1)) f)))

((repeated square 2) 5)
; 625