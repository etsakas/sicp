#lang sicp

(define tolerance 0.00001)

(define (fixed-point f first-guess)
  (define (close-enough? v1 v2)
    (< (abs (- v1 v2)) tolerance))
  (define (try guess)
    (display guess)
    (newline)
    (let ((next (f guess)))
      (if (close-enough? guess next)
          next
          (try next))))
  (try first-guess))


(define x-power-x-equals-1000 (fixed-point (lambda (x) (/ (log 1000) (log x))) 4.0)) ; without av. damping
x-power-x-equals-1000

(define x-power-x-equals-1000-dmp (fixed-point (lambda (x) (* 0.5 (+ x (/ (log 1000) (log x))))) 4.0)) ; with av.damping
x-power-x-equals-1000-dmp

; it's clear that using average damping reduces number of steps