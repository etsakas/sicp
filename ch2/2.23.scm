#lang sicp

(define (for-each proc ls)
  (cond ((null? ls) #t)
        (else (proc (car ls))
              (for-each proc (cdr ls)))))
      

(for-each (lambda (x)
            (newline)
            (display x))
          (list 57 321 88))