
;;
(define (stream-ref s n)
  (if (= n 0)
      (stream-car s)
      (stream-ref (stream-cdr s) (- n 1))))

(define (stream-map proc s)
  (if (stream-null? s)
      the-empty-stream
      (cons-stream (proc (stream-car s))
                   (stream-map proc (stream-cdr s)))))

(define (stream-null? x)
  (null? x))

(define the-empty-stream '())

(define (display-line x)
  (newline)
  (display x))

(define (cons-stream x y)
  (cons x (delay-new y)))

(define (stream-car stream) (car stream))

(define (stream-cdr stream) (force-new (cdr stream)))

(define (delay-new x)
  (lambda () x))

(define (force-new x)
  (x))

(define (stream-enumerate-interval low high)
  (if (> low high)
      the-empty-stream
      (cons-stream
       low
       (stream-enumerate-interval (+ low 1) high))))
;;
(define (show-new x)
  (display-line x)
  x)

(define x (stream-map show-new
                      (stream-enumerate-interval 0
                                                 10)))
(cdr x)
(stream-ref x 5)

(stream-ref x 2)

#|
按书上内容重写了一遍仍然有问题.

stream 没有得到保存, 每次重0开始读取, 且 show 函数没有执行
|#