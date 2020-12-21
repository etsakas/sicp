#lang sicp

(define (double f)
  (lambda (x) (f (f x))))

(define (inc x)
  (+ x 1))

((double inc) 1) ;3

; same as (inc (inc 1))

(((double (double double)) inc) 5) ;5

; equals
; (((double double) ((double double) inc)) 5)
; (((double double) (double (double inc))) 5)
; ((double (double (double (double inc)))) 5)
; 2*2*2*2=16, 16+5=21