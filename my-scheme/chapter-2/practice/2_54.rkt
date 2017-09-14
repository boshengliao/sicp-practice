; 2.54

(define t1 '(this is a list))
(define t2 '(this is a list))
(define t3 '(this (is a) list))
(equal? t1 t2)

(equal? t1 t3)

(eq? 'a 'a)

(pair? 'a)

(cadddr t1)

(or (null? 1) (null? 2))

(define (eql? x y)
  (cond ((or (null? x) (null? y))
         (eq? x y))
        ((not (and (pair? x)
                   (pair? y)))
         (eq? x y))
        ((and (pair? x)
              (pair? y))
         (if (eq? (car x) (car y))
             (eql? (cdr x) (cdr y))
             #f))))

(eql? '() '())