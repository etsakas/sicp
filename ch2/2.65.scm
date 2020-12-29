#lang sicp

(define (entry tree) (car tree))
(define (left-branch tree) (cadr tree))
(define (right-brach tree) (caddr tree))
(define (make-tree entry left right)
  (list entry left right))

;(define (tree->list-1 tree)
;  (if (null? tree)
;      '()
;      (append (tree->list-1 (left-branch tree))
;              (cons (entry tree)
;                    (tree->list-1 (right-brach tree))))))

(define (tree->list-2 tree)
  (define (copy-to-list tree result-list)
    (if (null? tree)
        result-list
        (copy-to-list (left-branch tree)
                      (cons (entry tree)
                            (copy-to-list (right-brach tree)
                                          result-list)))))
  (copy-to-list tree '()))

(define (list->tree elements)
  (car (partial-tree elements (length elements))))


(define (partial-tree elts n)
  (if (= n 0)
      (cons '() elts)
      (let ((left-size (quotient (- n 1) 2)))
        (let ((left-result (partial-tree elts left-size)))
          (let ((left-tree (car left-result))
                (non-left-elts (cdr left-result))
                (right-size (- n (+ left-size 1))))
            (let ((this-entry (car non-left-elts))
                  (right-result (partial-tree (cdr non-left-elts)
                                              right-size)))
              (let ((right-tree (car right-result))
                    (remaining-elts (cdr right-result)))
                (cons (make-tree this-entry left-tree right-tree)
                      remaining-elts))))))))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; from web: The tree->list-1 is of O(n log n) complexity. The tree->list-2 is of O(n) complexity.
; so the tree->list-2 will be used

; same as 2.62
(define (union-set-list set1 set2)
  (cond ((null? set1) set2)
        ((null? set2) set1)
        ((let ((x1 (car set1)) (x2 (car set2)))
          (cond ((= x1 x2) (cons x1 (union-set-list (cdr set1) (cdr set2))))
                ((< x1 x2) (cons x1 (union-set-list (cdr set1) set2)))
                ((< x2 x1) (cons x2 (union-set-list set1 (cdr set2)))))))))

; same as page 209
(define (intersection-set-list set1 set2)
  (if (or (null? set1) (null? set2))
      '()
      (let ((x1 (car set1))
            (x2 (car set2)))
        (cond ((= x1 x2)
               (cons x1
                     (intersection-set-list (cdr set1)
                                       (cdr set2))))
              ((< x1 x2)
               (intersection-set-list (cdr set1) set2))
              ((< x2 x1)
               (intersection-set-list set1 (cdr set2)))))))

(define (union-set set1 set2)
  (list->tree (union-set-list (tree->list-2 set1)
                              (tree->list-2 set2))))

(define (intersection-set set1 set2)
  (list->tree (intersection-set-list (tree->list-2 set1)
                                     (tree->list-2 set2))))


; testing
(define s1 (list->tree '(1 2 3 5 6 8 10 11)))
(define s2 (list->tree '(2 4 6 8 11 13)))
s1
s2
(union-set s1 s2)
(tree->list-2 (union-set s1 s2))
(intersection-set s1 s2)
(tree->list-2 (intersection-set s1 s2))