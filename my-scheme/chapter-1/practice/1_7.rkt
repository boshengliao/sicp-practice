; instance of book
(define (sqrt-iter guess x)
  (if (good-enough? guess x)
      guess
      (sqrt-iter (improve guess x)
                 x)))

(define (improve guess x)
  (average guess (/ x guess)))

(define (average x y)
  (/ (+ x y) 2))

(define (good-enough? guess x)
  (< (abs (- (square guess) x)) 0.001))

(define (sqrt1 x)
  (sqrt-iter 1.0 x))

(define (square x)
  (* x x))

; 1.7
(display "hello world\n")

(define (good-enough?-new guess x)
  (if (is-valid guess x)
      (good-enough? guess x)
      (display "x is invalid\n")))

(define (is-valid guess x)
  (> (- 2 (/ (improve guess x)
             (improve (improve guess x) x)))
     0.0000001))

; 当 x 的值过 大/小 且超过限定精度时, 结果的变化显得毫无意义

(define (sqrt-iter-new guess x)
  (if (good-enough?-new guess x)
      guess
      (sqrt-iter (improve guess x)
                 x)))

(define (sqrt-new x) (sqrt-iter-new 1.0 x))

(sqrt1 1000000000)
(sqrt-new 1000000000)