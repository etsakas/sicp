#lang sicp

(define (even? n)
  (= (remainder n 2) 0))

(define (fast-expt-iter b n)
  (define (fast-exp-iter-aux a b counter)
    (if (= counter 0)
        a
        (if (even? counter)
            (fast-exp-iter-aux a (* b b) (/ counter 2))
            (fast-exp-iter-aux (* a b) b (- counter 1))
            )))
  (fast-exp-iter-aux 1 b n))

(fast-expt-iter 3 3) ;27