; 3.15

(define x (list 'a 'b))
(define z1 (cons x x))

(define z2 (cons (list 'a 'b) (list 'a 'b)))

(define (set-to-wow! x)
  (set-car! (car x) 'wow)
  x)

#|

z1:  (cons x x)
           ↓ ↓
           ↓ ↓
     ↓←←←←←←←←
     ↓
    (a *) → (b *)

z2:  (cons list1 list2)
             ↓     ↓
             ↓     ↓
     ↓←←←←←←←←     →→→↓
     ↓                ↓
    (a *) → (b *)    (a *) → (b *)

调用 set-to-wow! 只改变了 car 位置的值, 所以
会有 z1 = ((wow b) wow b) 和 z2 = ((wow b) a b)
这样的结果.

|#