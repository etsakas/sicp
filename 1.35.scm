#lang sicp

; x = 1 + 1/x => x^2 = x + 1 => φ^2 = φ + 1 => φ = (1 + sqrt(5)) / 2 = 1.6180...

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

(define phi (fixed-point (lambda (x) (+ 1 (/ 1 x))) 1.0)) ; 1.0, not 1

phi