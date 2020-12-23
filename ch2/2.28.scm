#lang sicp

(define nil '())

(define (fringe tree)
  (define (fringe-aux tree result)
    (cond ((null? tree) result)
          ((not (pair? tree)) (cons tree result))
          (else (fringe-aux (car tree) (fringe-aux (cdr tree) result)))))
  (fringe-aux tree nil))

(define x (list (list 1 2) (list 3 4)))
(fringe x)
(fringe (list x x))

;(1 2 3 4)
;(1 2 3 4 1 2 3 4)