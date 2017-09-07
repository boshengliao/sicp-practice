; 2.28

(define (fringe x)
  (cond ((null? x) (list))
        ((not (pair? x)) (list x))
        (else (append (fringe (car x))
                      (fringe (cdr x))))))

(define t (list (list 1 2 3) (list 4 5 6)))

(fringe t)