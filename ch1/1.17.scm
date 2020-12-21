#lang sicp

(define (even? n)
  (= (remainder n 2) 0))

(define (mul a b)
  (if (= b 1)
      a
      (if (even? b)
          (mul (* a 2) (/ b 2))
          (+ a (mul a (- b 1))))))

(mul 5 5)