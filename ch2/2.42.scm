#lang sicp

(define nil '())

(define (filter predicate sequence)
  (cond ((null? sequence) nil)
        ((predicate (car sequence))
         (cons (car sequence)
               (filter predicate (cdr sequence))))
        (else (filter predicate (cdr sequence)))))

(define (enumerate-interval low high)
  (if (> low high)
      nil
      (cons low (enumerate-interval (+ low 1) high))))

(define (accumulate op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence)
          (accumulate op initial (cdr sequence)))))

(define (flatmap proc seq)
  (accumulate append nil (map proc seq)))

(define (queens board-size)
  (define (queen-cols k)
    (if (= k 0)
        (list empty-board)
        (filter
          (lambda (positions) (safe? k positions))
          (flatmap
            (lambda (rest-of-queens)
              (map (lambda (new-row)
                     (adjoin-position
                      new-row k rest-of-queens))
                   (enumerate-interval 1 board-size)))
            (queen-cols (- k 1))))))
  (queen-cols board-size))

(define empty-board nil)

(define (adjoin-position row column positions)
  (cons row positions))
; since we know k, the fact that no more than one queen can exist in a column means that
; its enough to know its' row position


(define (safe? column positions)
  (define (safe-iter col pos result)
    (if (null? pos)
        result
        (let ((last_pos (car positions))
              (current_pos (car pos))
              (rest (cdr pos)))
          (safe-iter (+ col 1)
                     rest
                     (or (= last_pos (+ current_pos col))
                         (= last_pos (- current_pos col))
                         (= last_pos current_pos)
                         result)))))
  (not (safe-iter 1 (cdr positions) #f)))

(queens 8)
(length (queens 8))


  
