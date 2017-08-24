; 1.43
(define square (lambda (x) (* x x)))

(square (square 5))

(define (compose a b)
  (lambda (x)
    (define (iter c d)
      (if (= d b)
          c
          (iter (a c) (+ d 1))))
    (iter (a x) 1)))

((compose square 2) 5)
