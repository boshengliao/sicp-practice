; 2.4

(define (cons1 x y)
  (lambda (m) (m x y)))

(define (car1 z)
  (z (lambda (p g) p)))


(define (cdr1 z)
  (z (lambda (p g) g)))

(car1 (cons1 4 2))
(cdr1 (cons1 4 2))