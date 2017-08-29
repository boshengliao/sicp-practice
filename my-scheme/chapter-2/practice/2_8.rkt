; 2.8

(load "2_7.rkt")

(define (sub-interval x y)
  (let ((p1 (- (lower-bound x) (lower-bound y)))
        (p2 (- (upper-bound x) (upper-bound y))))
    (make-interval p1
                   p2)))

(define t-sub1 (make-interval 1 4))
(define t-sub2 (make-interval 2 5))
(sub-interval t-sub1 t-sub2)