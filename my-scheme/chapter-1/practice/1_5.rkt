; 1.5
(define (p) (p))
(define (test x y)
  (if (= x 0)
      0
      y))

#|
解答: 正则序 运行, 会在第一个 (p) 的运算中进入循环
应用序 运行, 会返回 0
|#

;(test 0 (p))