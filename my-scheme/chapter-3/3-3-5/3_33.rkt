; 3.33
(load "instance.rkt")

(define (averager a b c)
  (let ((s (make-connector))
        (f (make-connector)))
    (adder a b s)
    (multiplier s f c)
    (constant 0.5 f)
    'ok))

(define a (make-connector))
(define b (make-connector))
(define c (make-connector))

(averager a b c)

(probe 'a a)
(probe 'b b)
(probe 'c c)

(set-value! a 10 'user)
(set-value! b 6 'user)
