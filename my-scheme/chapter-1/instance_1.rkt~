(+ 137 349)

(- 1000 334)

(* 5 99)

(/ 10 5)

(+ 2.7 10)

(+ 21 35 12 7)

(* 25 4 12)

(+ (* 3 5) (- 10 6))

(+ (* 3
      (+ (* 2 4)
         (+ 3 5)))
   (+ (- 10 7)
      6))

(define size 2)
size

(* 5 size)

(define pi 3.14159)
(define radius 10)

(* pi (* radius radius))

(define circumference (* 2 pi radius))
circumference

(* (+ 2 (* 4 6))
   (+ 3 5 7))

(define (square x) (* x x))
(square 12)
(square (+ 2 5))
(square (square 3))

(define (sum-of-squares x y)
  (+ (square x) (square y)))
(sum-of-squares 3 4)

(define (f a)
  (sum-of-squares (+ a 1) (* a 2)))
(f 5)

(define (absValue1 x)
  (cond ((< x 5) (+ x 1))
        ((> x 0) x)
        ((= x 0) 0)
        ((< x 0) (- x))))
(absValue1 3)
(absValue1 6)

(define (absValue2 x)
  (cond ((> x 0) x)
        (else (- x))))
(absValue2 5)

(define (absValue3 x)
  (if (< x 0)
      (- x)
      x))
(absValue3 1)

(define (t1 x)
  (if (and (> x 5)
           (< x 10))
      x
      1))
(t1 5)
(t1 10)
(t1 7)

(define (gt1 x y)
  (or (> x y)
      (= x y)))
(gt1 1 2)
(gt1 2 1)

(define (gt2 x y )
  (not (< x y)))
(gt2 1 2)
(gt2 2 1)