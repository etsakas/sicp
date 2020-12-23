#lang sicp

(define nil '())

;(define (square-tree tree)
;  (define (square x) (* x x))
;  (map (lambda (sub-tree) (if (not (pair? sub-tree))
;                              (square sub-tree)
;                              (square-tree sub-tree))) tree))

(define (square x) (* x x))
(define (square-tree tree)
  (cond ((null? tree) nil)
        ((not (pair? tree)) (square tree))
        (else (cons (square-tree (car tree))
                    (square-tree (cdr tree))))))

(list 1 (list 2 (list 3 4) 5) (list 6 7))
(square-tree (list 1 (list 2 (list 3 4) 5) (list 6 7)))