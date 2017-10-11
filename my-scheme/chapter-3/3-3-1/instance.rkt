; 3.3.1

#|
(define (cons x y)
  (let ((new (get-new-pair)))
    (set-car! new x)
    (set-cdr! new y)
    new))
|#

(define x (list 'a 'b))
(define z1 (cons x x))

x
z1
(car z1)
(cdr z1)

(define z2 (cons (list 'a 'b) (list 'a 'b)))

z2
(car z2)
(cdr z2)

(define (set-to-wow! x)
  (set-car! (car x) 'wow)
  x)

(set-to-wow! z1)
(set-to-wow! z2)

(eq? (car z1) (cdr z1))
(eq? (car z2) (cdr z2))