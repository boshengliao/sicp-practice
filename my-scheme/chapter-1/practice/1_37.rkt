; 1.37

; 递归计算过程
(define (con-frac n d k)
  (define (t x y z)
    (let ((next 1))
      (if (= z k)
          0
          (/ x (+ y (t x y (+ z 1)))))))
    (t n d 0))

; 迭代计算过程
(define (con-frac-iter n d k)
  (define (enough? x y)
    (if (< (abs (- x y)) 0.0001)
        #t
        #f))
  (define (info x y)
    (display "k: ")
    (display x)
    (display " ")
    (display "result: ")
    (display y)
    (newline))
  (define (t x y z r)
    (let ((next (/ x (+ y r)))
          (now r))
      (if (enough? now next)
          (info (+ z 1) next)
          (t x y (+ z 1) next))))
    (t n d 0 0))

(con-frac 1.0 1.0 11)

(con-frac-iter 1.0 1.0 9)

