; 3.19

(load "3_12.rkt")
(load "3_17.rkt")

(define (make-cycle x)
  (set-cdr! (last-pair x) x)
  x)

(define z (make-cycle (list 'a 'b 'c)))

;;
(define (cycle? x)
  (define (iter a b)
    (cond ((or (null? a)
               (null? b)
               (null? (cdr b)))
           #f)
          ((eq? (car a) (cadr b)) #t)
          (else (iter (cdr a) (cddr b)))))
  (iter x x))

(cycle? (list 1 2 4))
(cycle? (list 1 2 3 4))
(cycle? (list 1 2 3 4 5))
(cycle? z)
