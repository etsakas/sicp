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


; testing

(define ptest (make-point -2 2))
(x-point ptest)
(y-point ptest)
(print-point ptest)
(newline)
(define p1 (make-point 1 2))
(define p2 (make-point 5 2))
(define seg (make-segment p1 p2))
(start-segment seg)
(end-segment seg)
(midpoint-segment seg)