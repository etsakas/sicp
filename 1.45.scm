#lang sicp

(define (square x) (* x x))

(define tolerance 0.00001)

(define (fixed-point f first-guess)
  (define (close-enough? v1 v2)
    (< (abs (- v1 v2)) tolerance))
  (define (try guess)
    (let ((next (f guess)))
      (if (close-enough? guess next)
          next
          (try next))))
  (try first-guess))

(define (compose f g)
  (lambda (x) (f (g x))))

; n>=1
(define (repeated f n)
  (if (= n 1)
      f
      (compose (repeated f (- n 1)) f)))

(define (average x y) (/ (+ x y) 2))

(define (average-damp f)
  (lambda (x) (average x (f x))))

(define (fixed-point-of-transform g transform guess)
  (fixed-point (transform g) guess))

; test apply average-damp 1 times on nth-powers of 10

;(nth-root 1 10)
;(nth-root 2 100)
;(nth-root 3 1000)
;(nth-root 4 10000) ; fails

; test: apply average-damp 2 times on nth-powers of 10

;(nth-root 1 10)
;(nth-root 2 100)
;(nth-root 3 1000)
;(nth-root 4 10000)
;(nth-root 5 100000)
;(nth-root 6 1000000)
;(nth-root 7 10000000)
;(nth-root 8 100000000) ; fails

; test apply average-damp 3 times on nth-powers of 10

;(nth-root 1 10)
;(nth-root 2 100)
;(nth-root 3 1000)
;(nth-root 4 10000)
;(nth-root 5 100000)
;(nth-root 6 1000000)
;(nth-root 7 10000000)
;(nth-root 8 100000000)
;(nth-root 9 1000000000)
;(nth-root 10 10000000000)
;(nth-root 11 100000000000)
;(nth-root 12 1000000000000)
;(nth-root 13 10000000000000)
;(nth-root 14 100000000000000)
;(nth-root 15 1000000000000000)
;(nth-root 16 10000000000000000) ; fails

; so, for av.damp=1,2,3 we can find maximum root n=3,7,15
; floor(log_2 n) will work

(define (log_2 x)
  (/ (log x) (log 2)))

(define (nth-root n x)
  (define (y-powers-n-minus-one k res y)
    (if (= k 0)
        res
        (y-powers-n-minus-one (- k 1) (* res y) y)))
  (fixed-point-of-transform (lambda (y) (/ x (y-powers-n-minus-one (- n 1) 1.0 y)))
                            (repeated average-damp (floor (log_2 n)))
                            1.0))

(nth-root 4 10000) ; works
(nth-root 8 100000000) ; works
(nth-root 16 10000000000000000) ; works
