#lang sicp

(define (inc x) (+ x 1))

;1.43
(define (compose f g)
  (lambda (x) (f (g x))))

; n>=1
(define (repeated f n)
  (if (= n 1)
      f
      (compose (repeated f (- n 1)) f)))

(define zero (lambda (f) (lambda (x) x))) ; (zero f) x -> x
(define (add-1 n) (lambda (f) (lambda (x) (f ((n f) x)))))
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;(add-1 zero)
;(lambda (f) (lambda (x) (f ((zero f) x))))
;(lambda (f) (lambda (x) (f (((lambda (f) (lambda (x) x)) f) x))))
;(lambda (f) (lambda (x) (f (((lambda (x) x)) x))))
;(lambda (f) (lambda (x) (f x)))

(define one (lambda (f) (lambda (x) (f x))))

;(add-1 one)
;(lambda (f) (lambda (x) (f ((one f) x))))
;(lambda (f) (lambda (x) (f (((lambda (f) (lambda (x) (f x))) f) x))))
;(lambda (f) (lambda (x) (f ((lambda (x) (f x)) x))))
;(lambda (f) (lambda (x) (f (f x))))

(define two (lambda (f) (lambda (x) (f (f x)))))

(define (add m n)
  (lambda (f) (lambda (x) ((m f) ((n f) x)))))

(define (mul m n) ; add m to n
  (define m-number ((m inc) 0))
  (define n-number ((n inc) 0))
  (lambda (f) (lambda (x) ((repeated f (* m-number n-number)) x))))

;testing...

((zero inc) 2) ;2
((two inc) 5) ;7
((one inc) 9) ;10
(define three (add one two))
((three inc) 0) ;3
(define four (add two two))
((four inc) 0) ;4
(define twelve (mul three four))
((twelve inc) 0) ;12
(define sixteen (mul four four))
((sixteen inc) 0) ;16

