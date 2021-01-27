#lang racket

; We are going to use a table of one line because there is only
; one operation of apply, the deriv. The type is specified from
; the operator applied to the operands. At some point deriv will
; have to process either numbers or variables, which can't be lists,
; so there is nothing to extract using operator or operands procedures.

; get and put implementation
(define *the-table* (make-hash))
(define (put key1 key2 value) (hash-set! *the-table* (list key1 key2) value))
(define (get key1 key2) (hash-ref *the-table* (list key1 key2) #f))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; book's code
(define (variable? x) (symbol? x)) ; symbol? is primitive

(define (same-variable? v1 v2)
  (and (variable? v1) (variable? v2) (eq? v1 v2))) ; eq? compares two symbols

(define (=number? exp num)
  (and (number? exp) (= exp num)))

(define (deriv exp var)
   (cond ((number? exp) 0)
         ((variable? exp) (if (same-variable? exp var) 1 0))
         (else ((get 'deriv (operator exp)) (operands exp) var))))

(define (operator exp) (car exp))
(define (operands exp) (cdr exp))

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

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(define (addend s) (car s)) 
  
(define (augend s) 
  (let ((cs (cdr s))) 
    (if (null? (cdr cs)) 
        (car cs) 
        (cons '+ cs))))

(define (multiplier p) (car p)) 

(define (multiplicand p) 
  (let ((cs (cdr p))) 
    (if (null? (cdr cs)) 
        (car cs) 
        (cons '* cs))))
; multiplicand and augend could be cadr but then we should have
; exactly two operands for every operator. Using the implementation
; we can write expressions like (+ x x x)

(define (install-deriv-sum)
  (define (deriv-sum exp var)
    (make-sum (deriv (addend exp) var)
              (deriv (augend exp) var)))
  (put 'deriv '+ deriv-sum))

(define (install-deriv-product)
  (define (deriv-product exp var)
    (make-sum (make-product (multiplier exp)
                            (deriv (multiplicand exp) var))
              (make-product (deriv (multiplier exp) var)
                            (multiplicand exp))))
  (put 'deriv '* deriv-product))

;;;;; exponent
(define (exponentiation? x)
  (and (pair? x) (eq? (car x) '**)))

(define (base x) (car x))

(define (exponent x) (cadr x))

(define (make-exponentiation b e) 
  (cond ((=number? e 0) 1)
        ((=number? e 1) b)
        ((and (number? b) (number? e)) (expt b e))
        (else (list '** b e))))

(define (install-deriv-exponent)
  (define (deriv-exponent exp var)
         (make-product
           (exponent exp)
           (make-product
             (make-exponentiation 
               (base exp)
               (make-sum (exponent exp) -1))
             (deriv (base exp) var))))
  (put 'deriv '** deriv-exponent))

(install-deriv-sum)
(install-deriv-product)
(install-deriv-exponent)

;d: we just change the order of put arguments
;;;;;;;;;;;;;;;;;;;;;;;;

(deriv '(+ x x x x) 'x)
(deriv '(* x x x x) 'x)
(deriv '(+ 2 (* 5 x) x) 'x)
(deriv '(** x 3) 'x)
(deriv '(** a b) 'x)
(deriv '(** a b) 'a)
