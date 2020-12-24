#lang sicp

(define nil '())

(define (accumulate op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence)
          (accumulate op initial (cdr sequence)))))

(define (accumulate-n op init seqs)
  (if (null? (car seqs))
      nil
      (cons (accumulate op init (map car seqs)) ; map applies car to every element of outer list, that is the tree inner lists
            (accumulate-n op init (map cdr seqs))))) ; recursively call accumulate-n and give to it a (list (cdr inner_list1) (cdr inner_list2) ...)

(map car (list (list 1 2 3) (list 1 2 3) (list 1 2 3)))
(map cdr (list (list 1 2 3) (list 1 2 3) (list 1 2 3)))
(accumulate-n + 0 (list (list 1 2 3) (list 1 2 3) (list 1 2 3)))
;(1 1 1)
;((2 3) (2 3) (2 3))
;(3 6 9)