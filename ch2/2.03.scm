#lang sicp

(define (average x y) (/ (+ x y) 2))

(define (print-point p)
  (newline)
  (display "(")
  (display (x-point p))
  (display ",")
  (display (y-point p))
  (display ")"))

(define (make-point x y)
  (cons x y))

(define (x-point p)
  (car p))

(define (y-point p)
  (cdr p))

(define (make-segment start end)
  (cons start end))

(define (start-segment segment)
  (car segment))

(define (end-segment segment)
  (cdr segment))

(define (midpoint-segment segment)
  (make-point (average (x-point (start-segment segment)) (x-point (end-segment segment)))
              (average (y-point (start-segment segment)) (y-point (end-segment segment)))))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(define (rect-perimeter rect)
  (+ (* (width rect) 2) (* (height rect) 2)))

(define (rect-area rect)
  (* (width rect) (height rect)))

;(define (make-rect down-left up-right) ; down-left, up-right are points in plane
;  (let ((down-left-x (x-point down-left))
;        (up-right-x (x-point up-right))
;        (down-left-y (y-point down-left))
;        (up-right-y (y-point up-right)))
;    (if (<= (- up-right-x down-left-x) 0)
;        (error "up-right-x must be larger than down-left-x"))
;    (if (<= (- up-right-y down-left-y) 0)
;        (error "up-right-y must be larger than down-left-y")))
;  (cons down-left up-right))

;(define (width rect)
;  (let ((down-left-x (x-point (car rect)))
;        (up-right-x (x-point (cdr rect))))
;    (- up-right-x down-left-x)))
;
;(define (height rect)
;  (let ((down-left-y (y-point (car rect)))
;        (up-right-y (y-point (cdr rect))))
;    (- up-right-y down-left-y)))

; testing
;(define rect1 (make-rect (make-point 0 0) (make-point 5 5)))
;(rect-area rect1)
;(rect-perimeter rect1)

; 2nd implementation

(define (make-rect up-right width height)
  (cons up-right (cons width height)))

(define (width rect)
  (car (cdr rect)))

(define (height rect)
  (cdr (cdr rect)))

; testing
(define rect1 (make-rect (make-point 5 5) 5 5))
(rect-area rect1)
(rect-perimeter rect1)