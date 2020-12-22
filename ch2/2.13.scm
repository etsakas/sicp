#lang sicp

;[c1-t1*c1/100,c1+t1*c1/100]*[c2-t2*c2/100,c2+t2*c2/100]
; because we assume than we deal with positive number, we multiply lower with lower and upper with upper
;[c1*c2 -c1*t2*c2/100 -c1*c2*t1/100 + t1*c1*t2*c2/10000, c1*c2 + c1*t2*c2/100 + t1*c1*c2/100 + t1*c1*t2*c2/10000]
;[c1*c2*(1 - t2/100 - t1/100 + t1*t2/10000), c1*c2*(1 + t2/100 + t1/100 + t1*t2/10000)]
; get rid of /10000 terms
;[c1*c2*(1 - (t1+t2)/100), c1*c2*(1 + (t1+t2)/100)]

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

;[c1*c2*(1 - (t1+t2)/100), c1*c2*(1 + (t1+t2)/100)] means the tolerance of product is (t1+t2)%
(define (mul-interval x y)
  (make-center-percent (* (center x) (center y)) (+ (get-tolerance x) (get-tolerance y))))


; test
(define a (make-center-percent 10 10))
(define b (make-center-percent 100 10))
(define c (mul-interval a b))
c
(get-tolerance c)