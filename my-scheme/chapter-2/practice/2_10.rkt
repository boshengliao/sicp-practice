; 2.10

(load "2_7.rkt")

(define (error x)
  (display x)
  (newline))

(define (div-interval x y)
  (let ((t1 (upper-bound y))
        (t2 (lower-bound y)))
    (if (< (* t1 t2) 0)
        (error "区间跨0了!!")
        (mul-interval x
                      (make-interval (/ 1.0 (lower-bound y))
                               (/ 1.0 (upper-bound y)))))))

(define t1 (make-interval 1 1))
(define t2 (make-interval -1 -1))
(define t3 (make-interval -1 1))
(define t4 (make-interval 1 1))

(div-interval t1 t2)
(div-interval t1 t3)
(div-interval t1 t4)
