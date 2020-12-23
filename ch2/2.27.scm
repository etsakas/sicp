#lang sicp

(define nil '())

; 2.18
(define (reverse ls)
  (define (reverse-aux ls result)
    (if (null? ls)
        result
        (reverse-aux (cdr ls) (cons (car ls) result))))
  (reverse-aux ls nil))

(define (deep-reverse ls)
  (define (deep-reverse-aux ls result)
    (cond ((null? ls) result)
          ((not (pair? ls)) ls)
          (else (deep-reverse-aux (cdr ls) (cons (deep-reverse-aux (car ls) nil) result)))))
  (deep-reverse-aux ls nil))


(define x (list (list 1 2) (list 3 4)))
x
(reverse x) ;reverse procedure is built-in. Otherwise, you the one from exercise 2.18
(deep-reverse x)

;((1 2) (3 4))
;((3 4) (1 2))
;((4 3) (2 1))

; also
(define (deep-reverse-tree items)
  (if (pair? items)
      (map deep-reverse-tree (reverse items))
      items))

(deep-reverse-tree x)
