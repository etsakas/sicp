#lang sicp

(define (gcd a b)
  (if (= b 0)
      a
      (gcd b (remainder a b))))

(define (make-rat n d)
  (define (sign x y)
    (if (< (* x y) 0)
        -1
        1))
  (if (= d 0)
      (error "division by zero"))
  (let ((g (gcd n d)))
    (cons (* (sign n d) (abs(/ n g))) (abs(/ d g)))))

(make-rat 3 -4)