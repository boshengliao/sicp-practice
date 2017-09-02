; 2.14

(load "2_7.rkt")

(define (make-center-percent x p)
  (let ((delta (* x p)))
    (make-interval (- x delta)
                   (+ x delta))))

(define t (make-center-percent 10.0 0.1))

(display t)
(newline)

(define (percent x)
  (let ((up (upper-bound x))
        (low (lower-bound x))
        (c (center x)))
    (/ (/ (- up low) 2) c)))

(define (center i)
  (let ((v1 (lower-bound i))
        (v2 (upper-bound i)))
    (/ (+ v1 v2) 2)))

(percent t)
(center t)