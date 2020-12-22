#lang sicp

;a and b are prime numbers, so by
;https://en.wikipedia.org/wiki/Fundamental_theorem_of_arithmetic
;2^a * 3^b is a unique number, that is, there is not another product of primes
;that can produce the same result. This way we can get back a and b by multiple divisions by 2 and 3

(define (cons a b)
  (* (expt 2 a) (expt 3 b))) ; expt is built-in procedure

(define (get-exp product base)
  (define (devides? x y) ; x/y?
    (if (= (remainder x y) 0)
        #t
        #f))
  (define (get-exp-aux product exp)
    (if (devides? product base)
        (get-exp-aux (/ product base) (+ exp 1))
        exp))
  (get-exp-aux product 0))

(define (car z)
  (get-exp z 2))

(define (cdr z)
  (get-exp z 3))

(car (cons 5 9))
(cdr (cons 13 24))

