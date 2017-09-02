; 2.13

(load "2_7.rkt")
(load "2_12.rkt")

(define (par1 r1 r2)
  (div-interval (mul-interval r1 r2)
                (add-interval r1 r2)))

(define (par2 r1 r2)
  (let ((one (make-interval 1 1)))
    (div-interval one
                  (add-interval (div-interval one r1)
                                (div-interval one r2)))))

(define t1 (make-interval 5.0 15.0))
(define t2 (make-interval 8.0 12.0))

(par1 t1 t2)
(par2 t1 t2)

(percent t1)
(percent t2)

(define (get-mul-percent x y)
  (let ((xp (percent x))
        (yp (percent y)))
    (/ (+ xp yp) 2)))

(get-mul-percent t1 t2)

(define (get-par-percent x y)
  (let ((xl (lower-bound x))
        (yl (lower-bound y))
        (xu (upper-bound x))
        (yu (upper-bound y)))
    (let ((vl (make-interval xl yl))
          (vu (make-interval xu yu)))
      (make-interval (percent vl)
                     (percent vu)))))

(define p1 (par1 t1 t2))
(define p2 (par2 t1 t2))
(get-par-percent p1 p2)