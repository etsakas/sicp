#lang sicp

(define (make-interval a b) (cons a b))

(define (lower-bound x)
  (min (car x) (cdr x)))

(define (upper-bound x)
  (max (car x) (cdr x)))

(define (make-center-width c w)
  (make-interval (- c w) (+ c w)))

(define (center i)
  (/ (+ (lower-bound i) (upper-bound i)) 2))

(define (width i)
  (/ (- (upper-bound i) (lower-bound i)) 2))

(define (make-center-percent c tolerance) ; tolerance in range [0,100]
  (make-center-width c (* c (/ tolerance 100.0))))

(define (get-tolerance interval)
  (* (/ (width interval) (center interval)) 100.0))


; test 
(define int (make-center-percent 10 20))
int
(center int)
(width int)
(get-tolerance int)
