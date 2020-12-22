#lang sicp

(define nil '())

(define (reverse ls)
  (define (reverse-aux ls result)
    (if (null? ls)
        result
        (reverse-aux (cdr ls) (cons (car ls) result))))
  (reverse-aux ls nil))
      

(reverse (list 1 4 9 16 25))