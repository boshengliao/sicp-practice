; 3.21

(load "instance.rkt")

(define q1 (make-queue))

(insert-queue! q1 'a)

(insert-queue! q1 'b)

(delete-queue! q1)

(delete-queue! q1)

(define (print-queue queue)
  (front-ptr queue))

#|
因为我们定义的 queue 实际上是有一个序对组成的,
car 部分是 queue 开始的指针, cdr 部分是最后的指针位置,
又因为 insert 操作始终是向 queue 末尾添加数据, 且 cdr 部分
的指针也随之变动.
所以 car 部分是实际 queue 的全部数据.

|#