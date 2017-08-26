; 1.45

(define tolerance 0.00001)

(define (fixed-point f first-guess)
  (define (close-enough? v1 v2)
    (< (abs (- v1 v2)) tolerance))
  (define (try guess)
    (let ((next (f guess)))
      (if (close-enough? guess next)
          next
          (try next))))
  (try first-guess))

(define (average x y)
  (/ (+ x y) 2))

(define (average-damp f)
  (lambda (x) (average x (f x))))

(define (repeated a b)
  (lambda (x)
    (define (iter c d)
      (if (= d b)
          c
          (iter (a c) (+ d 1))))
    (iter (a x) 1)))

; 以上为条件

; 构造 y = x/y^3
(define y4 (lambda (y) (/ x (* y y y))))

; 开 x 的4次方根
(define (kai4cifang x)
  (fixed-point ((repeated average-damp 2) (lambda (y) (/ x (* y y y))))
               1.0))

(kai4cifang 16)

; 构造 y=x^n 次方
(define t
  (lambda (x n)
    (define (iter a b)
      (if (> a n)
          b
          (iter (+ a 1) (* x b))))
    (iter 1.0 1.0)))

(t 2 10)

; 开 x 的 n 次方根
(define (kai-x-n x n)
  (fixed-point ((repeated average-damp (- n 2)) (lambda (y) (/ x (t y (- n 1)))))
               1.0))

(kai-x-n 27 3)