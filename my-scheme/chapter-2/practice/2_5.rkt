; 2.5

(define (cons1 x y)
  (* (expt 2 x)
     (expt 3 y)))

(define (car1 z)
  (if (= 0 (remainder z 2))
      (+ 1 (car1 (/ z 2)))
      0))

(define (cdr1 z)
  (if (= 0 (remainder z 3))
      (+ 1 (cdr1 (/ z 3)))
      0))

(define t (cons1 4 7))

(display t)
(newline)
(car1 t)
(cdr1 t)