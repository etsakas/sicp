#lang sicp

;f(n) = n if n < 3
;     = f(n-1) + 2f(n-2) + 3f(n-3) if n>=3

;recursive
(define (f n)
  (if (< n 3)
      n
      (+ (f (- n 1)) (* 2 (f (- n 2))) (* 3 (f (- n 3))))))

;iterative
(define (ff n)
  (define (ff-iter a b c n)
    (if (= n 0)
        a
        (ff-iter b c (+ c (* 2 b) (* 3 a)) (- n 1))))
  (ff-iter 0 1 2 n))

(f 10)
(ff 10)