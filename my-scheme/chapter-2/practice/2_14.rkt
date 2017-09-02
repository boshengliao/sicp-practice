; 2.14

(load "2_13.rkt")

(define t1 (make-center-percent 10.0 0.05))
(define t2 (make-center-percent 20.0 0.01))

(define a/a (div-interval t1 t1))
(define a/b (div-interval t1 t2))

(display a/a)
(newline)
(display a/b)
(newline)
(percent a/a)
(percent a/b)

#|
结论:
A/A 结果的误差是 A 自身误差的两倍
A/B 结果的误差是 A 的误差, 加上 B 的误差 
|#