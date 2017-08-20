; 1.31

(define PI 3.1415926)

; 递归计算过程
(define (product term a next b)
  (if (> a b)
      1
      (* (term a)
         (product term (next a) next b))))

; 迭代计算过程
(define (iter-product term a next b)
  (define (iter x y)
    (if (> x b)
        y
        (iter (next x) (* y (term x)))))
  (iter (exact->inexact 0) 1.0))

(define (term x)
  (if (or (= x 0)
          (not (odd? x)))
      (/ (+ x 2.0)
         (+ x 3.0))
      (/ (+ x 3.0)
         (+ x 2.0))))

(define (next x)
  (+ x 1))

;(product term 0 next 1000)
(iter-product term 0 next 10000000)
