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

(sqrt1 1000000)

; 1.6
(define (new-if p r1 r2)
  (cond (p r1)
        (else r2)))

(define (sqrt-iter guess x)
  (new-if (good-enough? guess x)
          guess
          (sqrt-iter (improve guess x)
                     x)))

;(sqrt-iter 1.0 2)
#|
因为每次调用 new-if 实际都是计算一个 cond 的 条件表达式,
致使结果会一直保存在内存中, 直到出现正确结果或者内存溢出为止
|#