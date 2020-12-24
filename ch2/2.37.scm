#lang sicp

; here we use the map version of footnote on page 143

(define nil '())

(define (accumulate op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence)
          (accumulate op initial (cdr sequence)))))

(define (accumulate-n op init seqs)
  (if (null? (car seqs))
      nil
      (cons (accumulate op init (map car seqs)) ; map applies car to every element of outer list, that is the tree inner lists
            (accumulate-n op init (map cdr seqs))))) ; recursively call accumulate-n and give to it a (list (cdr inner_list1) (cdr inner_list2) ...)

(define (dot-product v w)
  (accumulate + 0 (map * v w)))


(define (matrix-*-vector m v)
  (map (lambda (x) (dot-product v x)) m))

(define (transpose mat)
  (accumulate-n cons nil mat))

(define (matrix-*-matrix m n)
  (let ((cols (transpose n))) ;since n is transposed, we multiply each row of m with each column of cols matrix
    (map (lambda (x) (map (lambda (y) (dot-product x y)) cols)) m)))

(dot-product (list 1 2 3) (list 1 2 3))

(matrix-*-vector (list (list 1 0 -2) (list 0 3 -1) (list 1 2 1))
                 (list 3 -1 4))

(transpose (list (list 1 2) (list 3 4)))

(matrix-*-matrix (list (list 1 2) (list 3 4)) (list (list 5 6) (list 7 8)))