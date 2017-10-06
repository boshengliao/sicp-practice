; 3.1

(define (make-accumulator num)
  (lambda (p)
    (set! num (+ num p))
    num))

(define A (make-accumulator 5))

(A 10)
(A 10)