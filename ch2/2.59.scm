#lang sicp

(define (element-of-set? x set)
  (cond ((null? set) false)
        ((equal? x (car set)) true)
        (else (element-of-set? x (cdr set)))))

(define (adjoin-set x set)
  (if (element-of-set? x set)
      set
      (cons x set)))

(define (intersection-set set1 set2)
  (cond ((or (null? set1) (null? set2)) '())
        ((element-of-set? (car set1) set2)
         (cons (car set1)
               (intersection-set (cdr set1) set2)))
        (else (intersection-set (cdr set1) set2))))

;(element-of-set? 5 (list 1 2 3 4 5 6))
;(element-of-set? 0 (list 1 2 3 4 5 6))
;(adjoin-set 5 (list 1 2 3 4))
;(adjoin-set 2 (list 1 2 3 4))
;(intersection-set (list 1 2 3 4) (list 3 4 5 6))

(define (union-set set1 set2)
  (cond ((null? set1) set2)
        ((not (element-of-set? (car set1) set2))
             (cons (car set1) (union-set (cdr set1) set2)))
        (else (union-set (cdr set1) set2))))


(union-set (list 1 2 3 4 5 6 7 8) (list 3 4 5 6 10 11 12))
(union-set (list 1 2 3 4 5) '())
(union-set '() (list 1 2 3 4 5))

; a faster implementation (easy) would be to use length to both sets and then
; inside union replace set1 with the smaller set and set2 with the larger set