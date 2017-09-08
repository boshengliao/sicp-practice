; 2.30

(define (square-tree tree)
  (cond ((null? tree) (list))
        ((not (pair? tree)) (* tree tree))
        (else (cons (square-tree (car tree))
                    (square-tree (cdr tree))))))

(define t (list 1
                (list 2 (list 3 4) 5)
                (list 6 7)))

(square-tree t)

;;;;
(define (square-tree-map tree)
  (map (lambda (x)
         (if (pair? x)
             (square-tree-map x)
             (* x x)))
       tree))

(square-tree-map t)
