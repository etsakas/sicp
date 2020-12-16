#lang sicp
(define (cube x) (* x x x))
(define (p x) (- (* 3 x) (* 4 (cube x))))
(define (sine angle counter)
  
  (cond ((not (> (abs angle) 0.1))
        (display counter)
        (newline)))
  (if (not (> (abs angle) 0.1))
      angle
      (p (sine (/ angle 3.0) (+ counter 1)))))

(sine 12.15 0) ; p is applied 5 times

; TODO: find order of growth in space and number of steps (as a function of a)
; when (sine a) is evaluated
