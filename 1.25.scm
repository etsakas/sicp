#lang sicp

(define (square x) (* x x))

(define (even? n)
  (= (remainder n 2) 0))

(define (timed-prime-test n)
  (newline)
  (display n)
  (start-prime-test n (runtime)))

(define (start-prime-test n start-time)
  (if (fast-prime? n 50) ; give an arbitary number of tests
      (report-prime (- (runtime) start-time))))

(define (report-prime elapsed-time)
  (display " *** ")
  (display elapsed-time))

(define (fast-expt b n)
  (cond ((= n 0) 1)
        ((even? n) (square (fast-expt b (/ n 2))))
        (else (* b (fast-expt b (- n 1)))))) 

(define (new-expmod base exp m)
  (remainder (fast-expt base exp) m))

(define (expmod base exp m)
  (cond ((= exp 0) 1)
        ((even? exp)
         (remainder (square (expmod base (/ exp 2) m))
                    m))
        (else
         (remainder (* base (expmod base (- exp 1) m))
                    m))))

(define (fermat-test n)
  (define (try-it a)
    (= (expmod a n n) a))
  (try-it (+ 1 (random (- n 1)))))

(define (fast-prime? n times)
  (cond ((= times 0) true)
        ((fermat-test n) (fast-prime? n (- times 1)))
        (else false)))


(timed-prime-test 1999)

; modify fermat-test by changing expmod to new-expmod
; results produce larger time period when using new-expmod
; See footnote 46. expmod uses successive squaring while maintaining
; numbers less than m (because of mod m).
; Because square procedure in case of new-expmod deals with larger numbers, it takes more time to calculate