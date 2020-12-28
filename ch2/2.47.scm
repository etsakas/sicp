#lang sicp
(#%require sicp-pict)

;(define (make-frame origin edge1 edge2)
;  (list origin edge1 edge2))
;
;(define (origin-frame frame)
;  (car frame))
;
;(define (edge1-frame frame)
;  (car (cdr frame)))
;
;(define (edge2-frame frame)
;  (car (cdr (cdr frame))))
;
;; test
;(define f1 (make-frame 1 2 3))
;(origin-frame f1)
;(edge1-frame f1)
;(edge2-frame f1)

(define (make-frame origin edge1 edge2)
  (cons origin (cons edge1 edge2)))

(define (origin-frame frame) ; same
  (car frame))

(define (edge1-frame frame)
  (car (cdr frame)))

(define (edge2-frame frame)
  (cdr (cdr frame)))

; test
(define f1 (make-frame 1 2 3))
(origin-frame f1)
(edge1-frame f1)
(edge2-frame f1)