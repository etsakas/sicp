#lang sicp

(define x (list 1 2 3))
(define y (list 4 5 6))

(append x y) ;append procedure is built-in. Otherwise, you the one from page 139
(cons x y)
(list x y)

;(1 2 3 4 5 6)
;((1 2 3) 4 5 6)
;((1 2 3) (4 5 6))