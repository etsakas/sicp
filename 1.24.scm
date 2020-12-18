#lang sicp

(define (timed-prime-test n)
  (newline)
  (display n)
  (start-prime-test n (runtime)))

(define (start-prime-test n start-time)
  (if (fast-prime? n 50) ; give an arbitary number of test repetitions
      (report-prime (- (runtime) start-time))))

(define (report-prime elapsed-time)
  (display " *** ")
  (display elapsed-time))

(define (square x) (* x x))

(define (even? n)
  (= (remainder n 2) 0))


(define (search-for-primes start end)
  (define (search-for-primes-aux start end)
    (if (<= start end)
        (timed-prime-test start))
    (if (<= start end)
        (search-for-primes-aux (+ start 2) end)))

  (if (even? start)
      (search-for-primes-aux (+ start 1) end)
      (search-for-primes-aux start end)))

(define (expmod base exp m)
  (cond ((= exp 0) 1)
        ((even? exp)
         (remainder (square (expmod base (/ exp 2) m))
                    m))
        (else
         (remainder (* base (expmod base (- exp 1) m))
                    m))))

; because random function must take an argument larger than 0, 
; run search-for-primes with a start larger than 1
(define (fermat-test n)
  (define (try-it a)
    (= (expmod a n n) a))
  (try-it (+ 1 (random (- n 1)))))

(define (fast-prime? n times)
  (cond ((= times 0) true)
        ((fermat-test n) (fast-prime? n (- times 1)))
        (else false)))

(search-for-primes 2 199)

