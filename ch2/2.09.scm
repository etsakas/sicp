#lang sicp

;width = (upper-bound - lower-bound)/2
;
;let int1 and int2 be two intervals: (l1,u1), (l2,u2) with widths
;w1=(u1-l1)/2
;w2=(u2-l2)/2
;
;(add int1 int2) results in a new interval intplus: (lp,up) where
;
;lp=(l1+l2)/2
;up=(u1+u2)/2
;
;wp=(up-lp)/2=up/2-lp/2 =u1/4 + u2/4 - l1/4 - l2/4 = w1/2 + w2/2 = (w1+w2)/2
;
;similar for substruction
;
;for multiplication we will have to use specific values in order to work with mul-interval

(define (mul-interval x y)
  (let ((p1 (* (lower-bound x) (lower-bound y)))
        (p2 (* (lower-bound x) (upper-bound y)))
        (p3 (* (upper-bound x) (lower-bound y)))
        (p4 (* (upper-bound x) (upper-bound y))))
    (make-interval (min p1 p2 p3 p4)
                   (max p1 p2 p3 p4))))

(define (make-interval a b) (cons a b))

(define (lower-bound x)
  (min (car x) (cdr x)))

(define (upper-bound x)
  (max (car x) (cdr x)))


(define (width x) (/ (- (upper-bound x) (lower-bound x)) 2.0))
(define int1 (make-interval 0 5))
(define int2 (make-interval 5 10))
(define int3 (make-interval 10 15))
(define int4 (make-interval 15 20))
(define mul12 (mul-interval int1 int2))
(define mul34 (mul-interval int3 int4))
(width mul12)
(width mul34)

; we see that int1,int2,int3,int4 have the same width but mul12,mul34 have not
; same for division

(define (div-interval x y)
  (mul-interval
   x
   (make-interval (/ 1.0 (upper-bound y))
                  (/ 1.0 (lower-bound y)))))

(define div12 (div-interval int1 int2))
(define div34 (div-interval int3 int4))
(width div12)
(width div34)
