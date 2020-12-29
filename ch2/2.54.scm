#lang sicp

;(define (equal? list1 list2)
;  (cond ((and (not (pair? list1)) (not (pair? list2))) (eq? list1 list2))
;        ((or (and (pair? list1) (not (pair? list2))) (and (pair? list2) (not (pair? list1)))) #f)
;        (else (and (equal? (car list1) (car list2)) (equal? (cdr list1) (cdr list2))))))

(define (equal? list1 list2)
  (cond ((and (not (pair? list1)) (not (pair? list2))) (eq? list1 list2))
        (else (if (and (pair? list1) (pair? list2))
                  (and (equal? (car list1) (car list2)) (equal? (cdr list1) (cdr list2)))
                  #f))))


(equal? '(this is a list) '(this is a list))
(equal? '(this is a list) '(this (is a) list))