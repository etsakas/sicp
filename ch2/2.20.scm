#lang sicp

(define nil '())

(define (same-parity z . w) ;because it says at least one argument
  (define (same-parity-aux ls)
    (if (null? ls)
        nil
        (if (= (remainder z 2) (remainder (car ls) 2))
            (cons (car ls) (same-parity-aux (cdr ls)))
            (same-parity-aux (cdr ls)))))
  
  (same-parity-aux w))

(same-parity 1 2 3 4 5 6 7)
(same-parity 2 3 4 5 6 7)
  