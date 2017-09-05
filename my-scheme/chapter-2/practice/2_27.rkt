; 2.27

(define (list-reverse-iter x)
  (let ((l (- (length x) 1)))
    (display x)
    (define (iter tmp-l result)
      (let ((next-l (- tmp-l 1)))
        (if (< tmp-l 0)
            result
            (iter next-l
                  (append result
                          (list (list-ref x tmp-l)))))))
    (iter l (list))))

(list-reverse-iter (list (list 1 2 3) (list 4 5 6)))

(define (deep-reverse-1 x)
  (cond ((null? x) (list))
        ((not (pair? x)) (list x))
        (else (append (deep-reverse-1 (cdr x))
                      (deep-reverse-1 (car x))))))

(deep-reverse-1 (list (list 1 2 3 4) (list 4 5 6 7)))

(define (deep-reverse x)
  (cond ((null? x) (list))
        ((not (pair? x)) x)
        (else (append (deep-reverse (cdr x))
                      (list (deep-reverse (car x)))))))

(deep-reverse (list (list 1 2 3 4) (list 4 5 6 7)))
