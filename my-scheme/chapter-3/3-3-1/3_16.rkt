; 3.16

(define (count-pairs x)
  (if (not (pair? x))
      0
      (+ (count-pairs (car x))
         (count-pairs (cdr x))
         1)))

(define a (cons 'a 'b))
(define b (cons a a))
(define c (cons a 'a))

(define v1 b)
v1
(count-pairs v1)

(define v1 (list a a c))
v1
(count-pairs v1)


