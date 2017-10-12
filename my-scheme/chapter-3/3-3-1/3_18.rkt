; 3.18

(load "3_12.rkt")
(load "3_17.rkt")

(define (make-cycle x)
  (set-cdr! (last-pair x) x)
  x)

(define z (make-cycle (list 'a 'b 'c)))

;;
(define (cycle? x)
  (if (pair? (car x))
      (eq? (caar x) 'cycle)
      (set-identify x)))

(define (set-identify x)
  (set-car! x (cons 'cycle (car x)))
  (cycle? (cdr x)))

(cycle? z)