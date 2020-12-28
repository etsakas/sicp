#lang scheme
(require (planet soegaard/sicp:2:1/sicp))

(define (draw-outline frame)
  ((segments->painter (list (make-segment (make-vect 0 0) (make-vect 0 0.99))
                            (make-segment (make-vect 0 0) (make-vect 0.99 0))
                            (make-segment (make-vect 0.99 0) (make-vect 0.99 0.99))
                            (make-segment (make-vect 0 0.99) (make-vect 0.99 0.99))))
   frame))

(paint draw-outline)

(define (draw-x frame)
  ((segments->painter (list (make-segment (make-vect 1 0) (make-vect 0 1))
                            (make-segment (make-vect 0 0) (make-vect 1 1))))
   frame))

(paint draw-x)

(define (draw-diamond frame)
  ((segments->painter (list (make-segment (make-vect 0 0.5) (make-vect 0.5 0))
                            (make-segment (make-vect 0.5 0) (make-vect 1 0.5))
                            (make-segment (make-vect 1 0.5) (make-vect 0.5 1))
                            (make-segment (make-vect 0.5 1) (make-vect 0 0.5))))
   frame))

(paint draw-diamond)