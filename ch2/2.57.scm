#lang sicp

(define (variable? x) (symbol? x))

(define (same-variable? v1 v2)
  (and (variable? v1) (variable? v2) (eq? v1 v2)))

(define (make-sum a1 a2) 
  (cond ((=number? a1 0) a2)
        ((=number? a2 0) a1)
        ((and (number? a1) (number? a2)) (+ a1 a2))
        (else (list '+ a1 a2))))

(define (make-product m1 m2) 
  (cond ((or (=number? m1 0) (=number? m2 0)) 0)
        ((=number? m1 1) m2)
        ((=number? m2 1) m1)
        ((and (number? m1) (number? m2)) (* m1 m2))
        (else (list '* m1 m2))))

(define (=number? exp num)
  (and (number? exp) (= exp num)))

(define (sum? x)
  (and (pair? x) (eq? (car x) '+)))

(define (addend s) (cadr s))

(define (product? x)
  (and (pair? x) (eq? (car x) '*)))

(define (multiplier p) (cadr p))

(define (exponentiation? x)
  (and (pair? x) (eq? (car x) '**)))

(define (base x) (cadr x))

(define (exponent x) (caddr x))

(define (make-exponentiation b e) 
  (cond ((=number? e 0) 1)
        ((=number? e 1) b)
        ((and (number? b) (number? e)) (expt b e))
        (else (list '** b e))))

(define (deriv exp var)
  (cond ((number? exp) 0)
        ((variable? exp)
         (if (same-variable? exp var) 1 0))
        ((sum? exp)
         (make-sum (deriv (addend exp) var)
                   (deriv (augend exp) var)))
        ((product? exp)
         (make-sum
           (make-product (multiplier exp)
                         (deriv (multiplicand exp) var))
           (make-product (deriv (multiplier exp) var)
                         (multiplicand exp))))
        ((exponentiation? exp)
         (make-product
           (exponent exp)
           (make-product
             (make-exponentiation 
               (base exp)
               (make-sum (exponent exp) -1))
             (deriv (base exp) var))))
        (else
         (error "unknown expression type -- DERIV" exp))))

; looking at deriv, we see that we have to change augend and multiplicand
; because both procedures will take the "first of the rest" argument, not the rest that we actually need.
; (augend '(+ x y z)) ; y
; (multiplicand '(* x y z)) ; y

; we can define a procedure that checks if the operation to be applied is going to take two arguments or more

(define (binary-exp? exp)
  (if (null? (cdddr exp))
      #t
      #f))

(define (augend s)
  (if (binary-exp? s)
      (caddr s)
      (append '(+) (cddr s))))
  
(define (multiplicand p)
    (if (binary-exp? p)
      (caddr p)
      (append '(*) (cddr p))))

; (caddr '(+ a b c d)) ; b
; (cddr '(+ a b c d)) ; b c d

; (augend '(+ a b c d))
; (multiplicand '(+ a b c d))

(deriv '(* (* x y) (+ x 3)) 'x)
(deriv '(* x y (+ x 3)) 'x)
