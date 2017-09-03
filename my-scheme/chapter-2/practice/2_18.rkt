; 2.18
(load "2_17.rkt")

(define (list-reverse x)
  (define (iter b c)
    (if (= c 0)
        b
        (cons (list-ref x c)
              (iter (list-ref x (- c 1))
                    (- c 1)))))
  (iter 0 (- (length x) 1)))

(list-reverse (list 1 2 3))

(define (list-reverse-iter x)
  (let ((l (- (length x) 1)))
    (define (iter tmp-l result)
      (let ((next-l (- tmp-l 1)))
        (if (< tmp-l 0)
            result
            (iter next-l
                  (append result (list (list-ref x tmp-l)))))))
    (iter (- l 1) (list (list-ref x l)))))

(list-reverse-iter (list 1 2 3 4 5 6))