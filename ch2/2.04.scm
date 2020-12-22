#lang sicp

(define (cons x y)
  (lambda (m) (m x y)))

(define (car z)
  (z (lambda (p q) p)))

(define (cdr z)
  (z (lambda (p q) q)))

(car (cons 6 8))
; equals to
;((lambda (m) (m 6 8)) (lambda (p q) p))
;((lambda (p q) p) 6 8)

(cdr (cons 6 8))
; equals to
;((lambda (m) (m 6 8)) (lambda (p q) q))
;((lambda (p q) q) 6 8)