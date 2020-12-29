#lang sicp

; same
(define (element-of-set? x set)
  (cond ((null? set) false)
        ((equal? x (car set)) true)
        (else (element-of-set? x (cdr set)))))
  
(define (adjoin-set x set)
  (cons x set))

(define (union-set set1 set2)
  (append set1 set2))


;(adjoin-set 5 (list 1 2 3 4))
;(adjoin-set 2 (list 1 2 3 4))
;(union-set (list 1 2 3 4 5 6 7 8) (list 3 4 5 6 10 11 12))
;(union-set (list 1 2 3 4 5) '())
;(union-set '() (list 1 2 3 4 5))
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(define (intersection-set set1 set2)
  (cond ((or (null? set1) (null? set2)) '())
        ((element-of-set? (car set1) set2)
         (cons (car set1)
               (intersection-set (cdr set1) set2)))
        (else (intersection-set (cdr set1) set2))))

(intersection-set (list 4 4 4) (list 4))
(intersection-set (list 4 5 5) (list 4 4 4 5))
;(4 4 4)
;(4 5 5)
; we need to change intersection-set too but i don't know what is the right behavior for this problem
; (intersection-set (list 4 4 4) (list 4)) = (4)? (4 4 4)? (4 4 4 4)?
; one implementation could be the following

(define (intersection-set2 set1 set2)
  (union-set (cond ((or (null? set1) (null? set2)) '())
               ((element-of-set? (car set1) set2)
                (cons (car set1)
                      (intersection-set (cdr set1) set2)))
               (else (intersection-set (cdr set1) set2)))
         (cond ((or (null? set2) (null? set1)) '())
               ((element-of-set? (car set2) set1)
                (cons (car set2)
                      (intersection-set (cdr set2) set1)))
               (else (intersection-set (cdr set2) set1)))))

(intersection-set2 (list 4 4 4) (list 4))
(intersection-set2 (list 4 5 5) (list 4 4 4 5))
;(4 4 4 4)
;(4 5 5 4 4 4 5)