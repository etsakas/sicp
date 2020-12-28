#lang scheme

(define (below painter1 painter2)
  (let ((split-point (make-vect 0.0 0.5)))
    (let ((paint-up
            (transform-painter painter1
                               (make-vect 0.0 0.0)
                               (make-vect 1.0 0.0)
                               split-point))
          (paint-down
            (transform-painter painter2
                               split-point
                               (make-vect 1.0 0.5)
                               (make-vect 0.0 1.0))))
      (lambda (frame)
        (paint-up frame)
        (print-down frame)))))

(define (rotate90 painter)
  ((transform-painter (make-vect 1.0 0.0)
                      (make-vect 1.0 1.0)
                      (make-vect 0.0 0.0))
   painter))

(define (rotate270 painter) 
  (transform-painter painter 
                     (make-vect 0.0 1.0) 
                     (make-vect 0.0 0.0) 
                     (make-vect 1.0 1.0)))

;(define (below painter1 painter2)
;  (rotate270 (beside (rotate90 painter1) (rotate90 painter2))))