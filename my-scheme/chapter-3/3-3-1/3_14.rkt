; 3.14

(define (mystery x)
  (define (loop x y)
    (if (null? x)
        y
        (let ((temp (cdr x)))
          (set-cdr! x y)
          (loop temp x))))
  (loop x '()))

#|
每次调用 loop, 程序都会先保存 (cdr x) 的值, 作为下一次调用的 x,
同时构造了下次调用 loop 所用的 y 值, 为 ((car x) *),
**wrong: mystery 最终返回最后一个非空的值.**

通过运行代码 mystery 最后返回一个 x 的倒序值
|#

(define v (list 'a 'b 'c 'd))

(define w (mystery v))
; 期待　ｗ　返回　(d)
; v 返回 (a)

w
v

; w 返回了参数 x 的倒序值