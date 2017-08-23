; 1.3.4

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

(define (square x)
  (* x x))

(define (average x y)
  (/ (+ x y) 2))

(define (average-damp f)
  (lambda (x) (average x (f x))))

((average-damp square) 10)

(define (sqrt-1 x)
  (fixed-point (average-damp (lambda (y) (/ x y)))
               1.0))



(define (deriv g)
  (lambda (x)
    (/ (- (g (+ x dx)) (g x))
       dx)))

(define dx 0.00001)

(define (cube x)
  (* x x x))

((deriv cube) 5)

(define (newton-transform g)
  (lambda (x)
    (- x (/ (g x) ((deriv g) x)))))

((newton-transform cube) 25)

(define (newtons-method g guess)
  (fixed-point (newton-transform g) guess))

(define (sqrt-2 x)
  (newtons-method (lambda (y) (- (square y) x))
                  1.0))
(define (cube-2 x)
  (newtons-method (lambda (y) (- (* y y y) x))
                  1.0))

(sqrt-2 9)
(cube-2 8)