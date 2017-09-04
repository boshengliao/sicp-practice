; 2.21

(define (square-list items)
  (map (lambda (x) (* x x))
       items))

(square-list (list 2 3 5))

(define (square-list-1 items)
  (if (null? items)
      (list)
      (cons (* (car items)
               (car items))
            (square-list-1 (cdr items)))))

(square-list-1 (list 2 3 5))