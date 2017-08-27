; 2.2

(define (make-segment x y)
  (cons x y))

(define (start-segment x)
  (car x))

(define (end-segment x)
  (cdr x))

(define (make-point x y)
  (cons x y))

(define (x-point x)
  (car x))

(define (y-point x)
  (cdr x))

(define (midpoint-segment x)
  (make-point (/ (+ (x-point (start-segment x))
                    (x-point (end-segment x)))
                 2)
              (/ (+ (y-point (start-segment x))
                    (y-point (end-segment x)))
                 2)))

(define t1 (make-point 4 1))
(define t2 (make-point 2 3))

;(display t1)
;(display t2)

(define l1 (make-segment t1 t2))

;(display l1)

(midpoint-segment l1)

(x-point (x-point l1))
(y-point (x-point l1))
(x-point (y-point l1))
(y-point (y-point l1))