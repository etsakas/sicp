#lang sicp
(#%require sicp-pict)

;(define (right-split painter n) 
;  (if (= n 0) 
;      painter 
;      (let ((smaller (right-split painter (- n 1)))) 
;        (beside painter (below smaller smaller)))))
;
;(define (up-split painter n)
;  (if (= n 0)
;      painter
;      (let ((smaller (up-split painter (- n 1))))
;        (below painter (beside smaller smaller)))))

(define (split f g)
  (lambda (painter n)
    (if (= n 0)
        painter
        (let ((smaller ((split f g) painter (- n 1))))
          (f painter (g smaller smaller))))))

(define right-split (split beside below))
(define up-split (split below beside))

(paint (right-split einstein 3))
(paint (up-split einstein 3))