; 2.37

(define t (list (list 1 2 3 4)
                (list 4 5 6 6)
                (list 6 7 8 9)))

(dot-product v w)

(matrix-*-vector m v)

(matrix-*-matrix m n)

(transpose m)

(define (dot-product v w)
  (accumulate + 0 (map * v w)))

(define (matrix-*-vector m v)
  (map ?? m))

(define (transpose mat)
  (accumulate-n ?? ?? mat))

(define (matrix-*-matrix m n)
  (let ((cols (transpose n)))
    (map ?? m)))

