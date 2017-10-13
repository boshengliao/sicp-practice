; 3.20

(define x (cons 1 2))
(define z (cons x x))
(set-car! (cdr z) 17)

(car x)
z
#|
定义 x 调用 cons 生成环境 E1,
定义 z 调用 cons 生成环境 E2, 但是 E2 是利用环境 E1 的值,
set-car! 通过 cdr z 实际是通过 E2 拿到 E1 里的值,
因此结果为 17
|#