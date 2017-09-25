; 2.4.1

#|

(make-from-real-imag (real-part z) (imag-part z))

(make-from-mag-ang (magnitude z) (angle z))

|#

(define (add-complex z1 z2)
  (make-from-real-imag (+ (real-part z1) (real-part z2))
                       (+ (imag-part z1) (imag-part z2))))

(define (sub-complex z1 z2)
  (make-from-real-imag (- (real-part z1) (real-part z2))
                       (- (imag-part z1) (imag-part z2))))

(define (mul-complex z1 z2)
  (make-from-mag-ang (* (magnitude z1) (magnitude z2))
                     (+ (angle z1) (angle z2))))

(define (div-complex z1 z2)
  (make-from-mag-ang (/ (magnitude z1) (magnitude z2))
                     (- (angle z1) (angle z2))))


;;;; Ben
(define (real-part-new z) (car z))

(define (imag-part-new z) (cdr z))

(define (square x) (* x x))
(define (magnitude-new z)
  (sqrt (+ (square (real-part z)) (square (imag-part z)))))

(define (angle-new z)
  (atan (image-part-new z) (real-part-new z)))

(define (make-from-real-imag x y) (cons x y))

(define (make-from-mag-ang r a)
  (cons (* r (cos a)) (* r (sin a))))


;;;;Alyssa

(define (real-part-new1 z)
  (* (magnitude-new1 z) (cos (angle-new1 z))))

(define (imag-part-new1 z)
  (* (magnitude-new1 z) (sin (angle-new1 z))))

(define (magnitude-new1 z) (car z))

(define (angle-new1 z) (cdr z))

(define (make-from-real-imag-new1 x y)
  (cons (sqrt (+ (square x) (square y)))
        (atan y x)))

(define (make-from-mag-ang-new1 r a) (cons r a))
