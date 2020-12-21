#lang sicp

(define (pascal row column)
  (if (or (= row column) (= column 1))
      1
      (+ (pascal (- row 1) (- column 1)) (pascal (- row 1) column))))

(pascal 5 1)
(pascal 5 2)
(pascal 5 3)
(pascal 5 4)
(pascal 5 5)

; let's try to print the triangle
; n is the depth and width of the triangle

(define (ptriangle n)
  (define (ptriangle-aux row column counter)
    (cond ((and (<= counter n) (<= column row))
           (display (pascal row column))
           (display " ")
           (ptriangle-aux row (+ column 1) counter))
          ((and (<= counter n) (> column row))
           (display "\n")
           (ptriangle-aux (+ row 1) 1 (+ counter 1)))))
                          
  (ptriangle-aux 1 1 1))


(ptriangle 6)
(display "**********")
; Berkeley's online interpreter prints the triangle but also
; throws SchemeError: Cannot evaluate an undefined expression (Why???)