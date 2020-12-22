#lang sicp

(define (make-interval a b) (cons a b))

(define (lower-bound x)
  (min (car x) (cdr x)))

(define (upper-bound x)
  (max (car x) (cdr x)))

(define (add-interval x y)
  (make-interval (+ (lower-bound x) (lower-bound y))
                 (+ (upper-bound x) (upper-bound y))))

;(define (mul-interval x y)
;  (let ((p1 (* (lower-bound x) (lower-bound y)))
;        (p2 (* (lower-bound x) (upper-bound y)))
;        (p3 (* (upper-bound x) (lower-bound y)))
;        (p4 (* (upper-bound x) (upper-bound y))))
;    (make-interval (min p1 p2 p3 p4)
;                   (max p1 p2 p3 p4))))

;[c1*c2*(1 - (t1+t2)/100), c1*c2*(1 + (t1+t2)/100)] means the tolerance of product is (t1+t2)%
(define (mul-interval x y)
  (make-center-percent (* (center x) (center y)) (+ (get-tolerance x) (get-tolerance y))))

(define (get-tolerance interval)
  (* (/ (width interval) (center interval)) 100.0))

(define (div-interval x y)
  (if (<= (* (lower-bound y) (upper-bound y)) 0)
      (error "y should not span zero"))
  (mul-interval
   x
   (make-interval (/ 1.0 (upper-bound y))
                  (/ 1.0 (lower-bound y)))))

(define (make-center-width c w)
  (make-interval (- c w) (+ c w)))

(define (center i)
  (/ (+ (lower-bound i) (upper-bound i)) 2))

(define (width i)
  (/ (- (upper-bound i) (lower-bound i)) 2))

(define (make-center-percent c tolerance) ; tolerance in range [0,100]
  (make-center-width c (* c (/ tolerance 100.0))))



(define (par1 r1 r2)
  (div-interval (mul-interval r1 r2)
                (add-interval r1 r2)))

(define (par2 r1 r2)
  (let ((one (make-interval 1 1)))
    (div-interval
     one
     (add-interval (div-interval one r1)
                   (div-interval one r2)))))
; test 1
(display "TEST 1")
(newline)
(define a (make-center-percent 10 10))
(define b (make-center-percent 100 10))
(define a-div-a (div-interval a a))
(define a-div-b (div-interval a b))
(center a-div-a)
(center a-div-b)
(get-tolerance a-div-a)
(get-tolerance a-div-b)

; test 2
(display "TEST 2")
(newline)
(define r1 (make-center-percent 10 10))
(define r2 (make-center-percent 100 10))
(define p1 (par1 r1 r2))
(define p2 (par2 r1 r2))
p1
p2
(get-tolerance p1)
(get-tolerance p2)
(newline)
(define p3 (par1 r2 r2))
p3
(get-tolerance p3)
(define p4 (par2 r2 r2))
p4
(get-tolerance p4)
;TEST 1
;1.0101010101010102
;0.101010101010101
;19.999999999999996
;20.00000000000001
;TEST 2
;(6.42791551882461 . 11.937557392102848)
;(8.18181818181818 . 10.0)
;30.0
;10.000000000000012
;
;(35.35353535353535 . 65.65656565656565)
;30.0
;(45.0 . 55.0)
;10.0
; we see that using par1 and par2, we indeed get different results
; also a-div-a should be center 1 but its not