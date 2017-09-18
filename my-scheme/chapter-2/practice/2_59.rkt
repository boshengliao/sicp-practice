; 2.59

(load "../instance/2_3_3.rkt")

(intersection-set (list 1 2 3) (list 2 3 4))

(define (union-set set1 set2)
  (cond ((and (null? set1) (null? set2)) '())
        ((null? set1) set2)
        ((null? set2) set1)
        ((element-of-set? (car set1) set2)
         (union-set (cdr set1) set2))
        (else (cons (car set1)
                    (union-set (cdr set1) set2)))))

(union-set (list 1 2) (list 2 3))