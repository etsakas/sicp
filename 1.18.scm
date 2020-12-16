#lang sicp

(define (even? n)
  (= (remainder n 2) 0))

(define (fast-mul-iter a b)
  (define (fast-mul-iter-aux a b sum)
    (if (= b 0)
        sum
        (if (even? b)
            (fast-mul-iter-aux (* a 2) (/ b 2) sum)
            (fast-mul-iter-aux a (- b 1) (+ sum a))
            )))
  (fast-mul-iter-aux a b 0))

(fast-mul-iter 7 10)
