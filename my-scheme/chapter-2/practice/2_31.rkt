; 2.31

(define t (list 1
                (list 2 (list 3 4) 5)
                (list 6 7)))

(define (square-tree tree) (tree-map square tree))

(define (tree-map f v)
  (map (lambda (x)
         (if (pair? x)
             (tree-map f x)
             (f x)))
       v))

(define (square x)
  (* x x))

(square-tree t)