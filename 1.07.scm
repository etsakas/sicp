#lang sicp
;if sqrt is a very small number, then x is still very small
;then good-enough as it is, will produce a "right" answer
;with large tolerance

;If x is very large, the computer won't be able to keep a decimal precision
;So the difference of x and guess will always be greater than 0.001
;and the algorithm will stuck in an infinite loop

;better good-enough?
(define (good-enough? guess x)
  (< (abs (- (improve guess x) guess)) (abs (* guess 0.0001))))
