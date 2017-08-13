; 1.1
#|
10

(+ 5 3 4)

(- 9 1)

(/ 6 2)

(+ (* 2 4) (- 4 6))

(define a 3)

(define b (+ a 1))

(+ a b (* a b))

(= a b)

(if (and (> b a) (< b (* a b)))
    b
    a)

(cond ((= a 4) 6)
      ((= b 4) (+ 6 7 a))
      (else 25))

(+ 2 (if (> b a) b a))

(* (cond ((> a b) a)
         ((< a b) b)
         (else -1))
   (+ a 1))

; 1.2
(/ (+ 5
      4
      (- 2
         (- 3
            (+ 6 (/ 4 5)))))
   (* 3
      (- 6 2)
      (- 2 7)))

; 1.3
(define (max2sum x y z)
  (cond ((and (< x y) (< x z)) (+ y z))
        ((and (< y x) (< y z)) (+ x z))
        ((and (< z x) (< z y)) (+ x y))))
(max2sum 1 2 3)
(max2sum 3 1 2)
(max2sum 2 3 1)

; 1.4
(define (a-plus-abs-b a b)
  ((if (> b 0) + -) a b))
(a-plus-abs-b 1 -5)
(a-plus-abs-b 1 5)
(a-plus-abs-b -1 5)
(a-plus-abs-b -1 -5)

; 1.5
(define (p) (p))
(define (test x y)
  (if (= x 0)
      0
      y))

#|
正则序 运行, 会在第一个 (p) 的运算中进入循环
应用序 运行, 会返回 0
|#
;(test 0 (p))
|#
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

(sqrt1 1000000)

; 1.6
#|
(define (new-if p r1 r2)
  (cond (p r1)
        (else r2)))

(define (sqrt-iter guess x)
  (new-if (good-enough? guess x)
          guess
          (sqrt-iter (improve guess x)
                     x)))
|#
;(sqrt-iter 1.0 2)
#|
因为每次调用 new-if 实际都是计算一个 cond 的 条件表达式,
致使结果会一直保存在内存中, 直到出现正确结果或者内存溢出为止
|#

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

(define (sqrt-iter-new guess x)
  (if (good-enough?-new guess x)
      guess
      (sqrt-iter (improve guess x)
                 x)))

(define (sqrt-new x) (sqrt-iter-new 1.0 x))

(sqrt1 1000000000)
(sqrt-new 1000000000)

