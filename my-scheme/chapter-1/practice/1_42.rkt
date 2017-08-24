; 1.42

(define inc (lambda (x) (+ x 1)))

(define (square y) (lambda (x) (* (y x) (y x))))

(define (compose x y)
  (lambda (z) ((x y) z)))

((compose square inc) 6)