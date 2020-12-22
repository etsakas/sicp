#lang sicp

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

;(define (div-interval x y)
;  (mul-interval
;   x
;   (make-interval (/ 1.0 (upper-bound y))
;                  (/ 1.0 (lower-bound y)))))

; if y spans zero, that is, it has a form [negative-number, positive-number]
; then, interval 1/y will have values [positive-number, negative-number] which does
; satisfy that we want interval to have the first form

(define (div-interval x y)
  (if (<= (* (lower-bound y) (upper-bound y)) 0)
      (error "y should not span zero"))
  (mul-interval
   x
   (make-interval (/ 1.0 (upper-bound y))
                  (/ 1.0 (lower-bound y)))))


; some thoughts that may be incorrect
; its obvious that y should not have a 0 because then division by zero is inevitable
; however, if y spans 0, although the make-interval inside div-interval will temporarily
; create a interval of the form [positive-number, negative-number], because selectors
; lower-bound and upper-bound are written as it is, they will pick the right value
; inside the mul-intervals procedure. So maybe, we only have to check if y has a 0 point.
; also, it seems that if y is of the form [x,x] (zero interval), division will work. Is this correct?