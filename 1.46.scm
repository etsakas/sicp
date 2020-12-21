#lang sicp

(define (iterative-improve good-enough? improve)
  (lambda (guess)
    (if (good-enough? guess)
        guess
        ((iterative-improve good-enough? improve) (improve guess)))))

(define (square x) (* x x))
(define (average x y) (/ (+ x y) 2))

; rewrite sqrt of page 38
(define (sqrt x)
  ((iterative-improve (lambda (guess) (< (abs (- (square guess) x)) 0.001))
                      (lambda (guess) (average guess (/ x guess))))
                      1.0))

(sqrt 49)

; rewrite fixed point of page 92

(define tolerance 0.00001)
(define (fixed-point f first-guess)
  ((iterative-improve
    (lambda (guess) (< (abs (- (f guess) guess)) tolerance))
    (lambda (guess) (f guess)))
   first-guess))

(define (sqrt2 x)
  (fixed-point (lambda (y) (average y (/ x y)))
               1.0))

(sqrt2 49)
