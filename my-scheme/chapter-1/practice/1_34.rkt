; 1.34

(define (f g)
  (g 2))

(define (square x)
  (* x x))

(f square)

(f (lambda (z) (* z (+ z 1))))

; 这里报错的原因的 函数f 的参数是作为运算符, 当接受的参数为f时,
; (f 2) 则会把 2 带入 (g 2) 得到 (2 2), 因此报错
(f f)
