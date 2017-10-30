; 3.34

(load "instance.rkt")

(define (squarer a b)
  (multiplier a a b))

(define a (make-connector))
(define b (make-connector))

(squarer a b)

(probe 'a a)
(probe 'b b)

(set-value! a 10 'user)

(forget-value! a 'user)
;(set-value! a 0 'user)

(set-value! b 9 'user)