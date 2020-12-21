#lang sicp

(define (cont-frac n d k) ; n and d are functions
  (define (recursive i)
;    (if (<= k 0)
;        (error "k must be greater than one"))
    (if (> i k) ; greater, because equals would ignore the k-th term
        0
        (/ (n i) (+ (d i) (recursive (+ i 1))))))
  (recursive 1))

(cont-frac (lambda (i) 1.0)
           (lambda (i) 1.0)
           20)

(define (cont-frac-iter n d k)
  (define (iter i result)
    (if (= 0 i)
        result
        (iter (- i 1)   (/ (n i) (+ (d i) result)))))
  (iter k 0))

(cont-frac-iter (lambda (i) 1.0)
           (lambda (i) 1.0)
           20)
