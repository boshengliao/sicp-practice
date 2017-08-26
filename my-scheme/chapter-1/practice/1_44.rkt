; 1.44
(load "1_43.rkt")

(define (smooth y)
  (lambda (x)
    (let ((dx 0.000001))
      (/ (+ (y (- x dx))
            (y x)
            (y (+ x dx)))
         3))))

((smooth square) 5)

((smooth (smooth square)) 5)

(((compose smooth 2) square) 5)

(define (smooth-n-times f n v)
  (((compose smooth n) f) v))

(smooth-n-times square 2 5)