; 3.34

(load "instance.rkt")

(define (squarer a b)
  (multiplier a a b))

(define a (make-connector))
(define b (make-connector))

(squarer a b)

(probe 'a a)
(probe 'b b)

;(set-value! a 10 'user)

;(forget-value! a 'user)
;(set-value! a 0 'user)

(set-value! b 9 'user)
(has-value? a)

;; 设置 a 时, a b 均能正确返回值, 但是当设置 b 时, a 无法返回值.
;; 因为 multiplier 没有考虑到, m1 m2 都为空的情况