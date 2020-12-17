#lang sicp

;a'=bq + aq + ap
;b' = bp + aq
;
;a''= b'q + a'q + a'p => bpq + aqq + bqq + aqq + apq + bqp + aqp + app => b(2pq + qq) + a(2pq + qq) + a(pp + qq)
;b'' = b'p + a'q => bpp + aqp + bqq + aqq + apq => b(pp + qq) + a(2pq + qq)
;
;=> p' = (pp + qq)
;   q' = (2pq + qq)



(define (even? n)
  (= (remainder n 2) 0))

(define (fib n)
  (fib-iter 1 0 0 1 n))
(define (fib-iter a b p q count)
  (cond ((= count 0) b) ; b is Fib(n), a is Fib(n+1)
        ((even? count)
         (fib-iter a
                   b
                   (+ (* p p) (* q q))
                   (+ (* 2 p q) (* q q))
                   (/ count 2)))
        (else (fib-iter (+ (* b q) (* a q) (* a p))
                        (+ (* b p) (* a q))
                        p
                        q
                        (- count 1)))))


(fib 6)