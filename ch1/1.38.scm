#lang sicp

; i created this div only for my needs.
; built-in module procedure won't work as neened
(define (div b a)
  (define (div-aux res k)
    (if (< res 0)
        (- k 1)
        (div-aux (- res a) (+ k 1))))
  (if (or (< b 0) (<= a 0))
      (error "b must be non-negative, a must be positive"))
  (div-aux b 0))

(define (cont-frac n d k) ; n and d are functions
  (define (recursive i)
;    (if (<= k 0)
;        (error "k must be greater than one"))
    (if (> i k) ; greater, because equals would ignore the k-th term
        0
        (/ (n i) (+ (d i) (recursive (+ i 1))))))
  (recursive 1))

(+ 2 (cont-frac (lambda (i) 1.0)
                (lambda (i)
                  (cond ((= 0 (remainder i 3)) 1.0)
                        ((= 1 (remainder i 3)) 1.0)
                        ((= 2 (remainder i 3)) (- i (div i 3.0)))))
                100))
