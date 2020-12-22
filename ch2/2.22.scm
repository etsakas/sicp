#lang sicp

(define (square x) (* x x))

(define (square-list items) 
  (define (iter things answer) 
    (if (null? things) 
        answer 
        (iter (cdr things) 
              (cons (square (car things)) answer)))) 
  (iter items nil))

; prints
; (16 9 4 1)
; answer =
; (cons item1 nil)
; (cons sq-item2 (cons sq-item1 nil)) etc, so Louis will get a reversed list with squared elements



;(define (square-list items) 
;  (define (iter things answer) 
;    (if (null? things) 
;        answer 
;        (iter (cdr things) 
;              (cons answer (square (car things)))))) 
;  (iter items nil))

; prints
; ((((() . 1) . 4) . 9) . 16)
; answer =
; (cons nil sq-item1)
; (cons (cons nil sq-item1) sq-item2) etc

; what Louis want is
; (cons sq-item1 (cons sq-item2 (cons....

(square-list (list 1 2 3 4)) 