; 1.3
(define (max2sum x y z)
  (cond ((and (< x y) (< x z)) (+ y z))
        ((and (< y x) (< y z)) (+ x z))
        ((and (< z x) (< z y)) (+ x y))))
(max2sum 1 2 3)
(max2sum 3 1 2)
(max2sum 2 3 1)