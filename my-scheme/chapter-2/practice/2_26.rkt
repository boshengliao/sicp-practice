; 2.26

(define x (list 1 2 3))

(define y (list 4 5 6))

; 在 y 的低位依次加上 x 的所有元素
(append x y)

; 在 y 的低位加上 x
(cons x y)

; 生成 list 为 (x y)
(list x y)