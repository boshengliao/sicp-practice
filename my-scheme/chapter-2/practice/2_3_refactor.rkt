; 2.3 refactor

(define (rectangle start end)
  (cons start end))

(define (make-point x y)
  (cons x y))

(define (x-point x)
  (car x))

(define (y-point x)
  (cdr x))

(define (cal-cir r)
  (let ((l1 (get-length r))
        (l2 (get-width r)))
    (* (+ l1 l2)
       2)))

(define (cal-area r)
  (let ((l1 (get-length r))
        (l2 (get-width r)))
    (* l1 l2)))

(define (get-length r)
  (let ((a (x-point r))
        (b (y-point r)))
    (let ((x-a (x-point a))
          (x-b (x-point b)))
      (abs (- x-a x-b)))))

(define (get-width r)
  (let ((a (x-point r))
        (b (y-point r)))
    (let ((y-a (y-point a))
          (y-b (y-point b)))
      (abs (- y-a y-b)))))

(define a (make-point 1 1))
(define c (make-point 4 4))
(define d (make-point 1 4))
(define b (make-point 4 1))

(rectangle a c)
(rectangle d b)

(define r1 (rectangle a c))
(define r2 (rectangle d b))

(cal-cir r1)
(cal-area r1)

(cal-cir r2)
(cal-area r2)