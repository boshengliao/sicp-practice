; 2.9


(load "2_8.rkt")

(define t1 (make-interval 2 4))
(define t2 (make-interval 2 6))

(define t3-add (add-interval t1 t2))
(define t3-sub (sub-interval t1 t2))

(define (two-params f x y)
  (let ((r1 (one-param x))
        (r2 (one-param y)))
    (f r1 r2)))

(define (one-param x)
  (let ((upper (upper-bound x))
        (lower (lower-bound x)))
    (/ (- upper lower)
       2)))

; 加/减的结果比较
(two-params + t1 t2)
(one-param t3-add)
(two-params - t1 t2)
(one-param t3-sub)

(define (mul-interval-t x y)
  (let ((p1 (* (lower-bound x) (lower-bound y)))
        (p2 (* (upper-bound x) (upper-bound y))))
    (make-interval p1
                   p2)))

(define t4 (mul-interval t1 t2))
(define t4-div (div-interval t1 t2))

(display t4)
(newline)
(display t4-div)
(newline)
(two-params * t1 t2)
(one-param t4)
(two-params / t1 t2)
(one-param t4-div)