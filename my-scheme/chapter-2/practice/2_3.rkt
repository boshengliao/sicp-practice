; 2.3

(define (rectangle start end)
  (cons start end))

(define (make-point x y)
  (cons x y))

(define (x-point x)
  (car x))

(define (y-point x)
  (cdr x))

(define (double x)
  (* x 2))

(define (circumference a b)
  (let ((x-a (x-point a))
        (y-a (y-point a))
        (x-b (x-point b))
        (y-b (y-point b)))
    (let ((l1 (abs (- x-a x-b)))
          (l2 (abs (- y-a y-b))))
      (double (+ l1 l2)))))

(define (area a b)
  (let ((x-a (x-point a))
        (y-a (y-point a))
        (x-b (x-point b))
        (y-b (y-point b)))
    (let ((l1 (abs (- x-a x-b)))
          (l2 (abs (- y-a y-b))))
      (* l1 l2))))

(define a (make-point 1 1))
(define c (make-point 4 4))
(define d (make-point 1 4))
(define b (make-point 4 1))

(rectangle a c)
(rectangle d b)

(define r1 (rectangle a c))

(define (cal-cir r)
  (let ((x (x-point r))
        (y (y-point r)))
    (circumference x y)))

(define (cal-area r)
  (let ((x (x-point r))
        (y (y-point r)))
    (area x y)))

(cal-cir r1)
(cal-area r1)