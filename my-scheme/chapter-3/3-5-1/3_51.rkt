; 3.51

(load "instance.rkt")

(define (show x)
  (display "A")
  (display-line x)
  (newline)
  x)
#||#
(define (a proc)
  (display "a")
  (lambda () proc))

(a (+ 1 2))

(define (b s n)
  (if (= n 0)
      (car s)
      (cons (car s)
            (a (b (cdr s) (- n 1))))))

(b (list 1 2 3 4) 3)
(define c (b (list 1 2 3 4) 3))

(car c)
((cdr c))




(define x (stream-map show
                      (stream-enumerate-interval 0 10)))

(stream-ref x 5)

;(display "aaa")
(stream-ref x 7)
;(display "aaa")

#|
不知道为什么, stream 信息没有得到保存, 每次都是从头开始读取
|#