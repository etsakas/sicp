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

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(define (make-segment v1 v2)
  (cons v1 v2))

(define (start-segment segment)
  (car segment))

(define (end-segment segment)
  (cdr segment))