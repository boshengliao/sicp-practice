; 1.9
(define (add-1 a b)
  (if (= a 0)
      b
      (inc (add-1 (dec a) b))))

(define (inc x)
  (+ x 1))

(define (dec x)
  (- x 1))
#|
(add 4 5)
(+ (add 3 5) 1)
(+ (+ (add 2 5) 1) 1)
(+ (+ (+ (add 1 5) 1) 1) 1)
(+ (+ (+ (+ (add 0 5) 1) 1) 1) 1)
(+ (+ (+ (+ 5 1) 1) 1) 1)
(+ (+ (+ 6 1) 1) 1)
(+ (+ 7 1) 1)
(+ 8 1)
9
|#
(add-1 4 5)

(define (add-2 a b)
  (if (= a 0)
      b
      (add-2 (dec a) (inc b))))
#|
(add 4 5)
(add 3 6)
(add 2 7)
(add 1 8)
(add 0 9)
9
|#
(add-2 4 5)