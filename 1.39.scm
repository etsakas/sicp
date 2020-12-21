#lang sicp

(define (cont-frac n d k) ; n and d are functions
  (define (recursive i)
;    (if (<= k 0)
;        (error "k must be greater than one"))
    (if (> i k) ; greater, because equals would ignore the k-th term
        0
        (/ (n i) (+ (d i) (recursive (+ i 1))))))
  (recursive 1))

(define (tan-cf x k)
  (cont-frac (lambda (i) (if (= i 1)
                             x
                             (- (* x x))))
             (lambda (i) (- (* 2 i) 1.0))
             k))

(tan-cf 1 10)
