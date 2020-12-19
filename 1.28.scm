#lang sicp

(define (square x) (* x x))

(define (even? n)
  (= (remainder n 2) 0))

(define (expmod base exp m)
  (define (non-trivial? x m)
    (if (and (not (or (= x 1) (= x (- m 1)))) (= (remainder (square x) m) 1))
        0
        x))
  
  (cond ((= exp 0) 1)
        ((even? exp)
         (remainder (square (non-trivial? (expmod base (/ exp 2) m) m)) m))
        (else (remainder (* base (expmod base (- exp 1) m)) m))))

(define (miller-rabin-test n)
  (define (try-it a)
     (= (expmod a (- n 1) n) 1))
  
  (define (iter times)
    (cond ((= times 0) #t)
          ((try-it (+ 1 (random (- n 1)))) (iter (- times 1)))
          (else #f)))
  (iter 20))

(miller-rabin-test 561)
(miller-rabin-test 1105)
(miller-rabin-test 1729)
(miller-rabin-test 2465)
(miller-rabin-test 2821)
(miller-rabin-test 6601)
(miller-rabin-test 7)
(miller-rabin-test 5)
(miller-rabin-test 11)