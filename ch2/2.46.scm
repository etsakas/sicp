#lang sicp
(#%require sicp-pict)

(define (make-vect x y)
  (cons x y))

(define (xcor-vect v)
  (car v))

(define (ycor-vect v)
  (cdr v))

(define (add-vect v1 v2)
  (let ((x (+ (xcor-vect v1) (xcor-vect v2)))
        (y (+ (ycor-vect v1) (ycor-vect v2))))
    (make-vect x y)))

(define (sub-vect v1 v2)
  (let ((x (- (xcor-vect v1) (xcor-vect v2)))
        (y (- (ycor-vect v1) (ycor-vect v2))))
    (make-vect x y)))

(define (scale-vect s v)
  (make-vect (* s (xcor-vect v)) (* s (ycor-vect v))))

; test

(define v1 (make-vect 4 5))
(define v2 (make-vect 8 10))
(xcor-vect v1)
(ycor-vect v2)
(add-vect v1 v2)
(sub-vect v2 v1)
(scale-vect 10 v1)