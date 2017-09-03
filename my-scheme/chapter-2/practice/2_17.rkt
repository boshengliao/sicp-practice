; 2.17

(define (last-pair x)
  (let ((l (- (length x) 1)))
    (list-ref x l)))

(last-pair (list 1 2 3 4 7))

(define (last-pair-iter x)
  (define (iter items result)
    (if (null? items)
        result
        (iter (cdr items) (car items))))
  (iter x 0))

(last-pair-iter (list 1 2 3 4 7))