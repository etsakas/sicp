#lang sicp

(define nil '())

(define (filter predicate sequence)
  (cond ((null? sequence) nil)
        ((predicate (car sequence))
         (cons (car sequence)
               (filter predicate (cdr sequence))))
        (else (filter predicate (cdr sequence)))))

(define (enumerate-interval low high)
  (if (> low high)
      nil
      (cons low (enumerate-interval (+ low 1) high))))

(define (accumulate op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence)
          (accumulate op initial (cdr sequence)))))

(define (flatmap proc seq)
  (accumulate append nil (map proc seq)))


(define (ordered-triples n)
  (flatmap (lambda (i) (flatmap (lambda (j) (map (lambda (k) (list k j i)) (enumerate-interval 1 (- j 1)))) (enumerate-interval 1 (- i 1)))) (enumerate-interval 1 n)))

;(ordered-triples 4)

(define (sum-of-triples triple)
  (+ (car triple) (car (cdr triple)) (car (cdr (cdr triple)))))

;(sum-of-triples (list 11 12 13))

(define (ordered-triples-of-sum-s n s)
  (filter (lambda (triple) (= s (sum-of-triples triple))) (ordered-triples n)))

(ordered-triples-of-sum-s 10 10)
;((2 3 5) (1 4 5) (1 3 6) (1 2 7))