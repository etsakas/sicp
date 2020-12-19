#lang sicp

(define (square x) (* x x))

(define (even? n)
  (= (remainder n 2) 0))

(define (expmod base exp m)
  (cond ((= exp 0) 1)
        ((even? exp)
         (remainder (square (expmod base (/ exp 2) m))
                    m))
        (else
         (remainder (* base (expmod base (- exp 1) m))
                    m))))

(define (fermat-test n a)
  (= (expmod a n n) a))

(define (carmichael? n)
  (define (carmichael-aux n a)
    (if (= a n)
        #t
        (if (fermat-test n a)
            (carmichael-aux n (+ a 1))
            #f)))
  (carmichael-aux n 1))

(carmichael? 561)
(carmichael? 1105)
(carmichael? 1729)
(carmichael? 2465)
(carmichael? 2821)
(carmichael? 6601)
(carmichael? 14) ; not a prime anyway


