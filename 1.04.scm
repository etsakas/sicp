#lang sicp
(define (p) (p))
(define (test x y)
  (if (= x 0) 0 y))

(test 0 (p))
;If the intepreter uses applicative-order evaluation
;then the (p) on (test 0 (p)) expands infinitely

;For normal-order evaluation (test 0 (p)) equals zero.
;Since 'if' is true, the else part won't evaluate, so (p)
;won't expand.
