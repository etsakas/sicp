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

; also, from page 159
(define (enumerate-tree tree)
  (cond ((null? tree) nil)
        ((not (pair? tree)) (list tree))
        (else (append (enumerate-tree (car tree))
                      (enumerate-tree (cdr tree))))))
(enumerate-tree x)
(enumerate-tree (list x x))