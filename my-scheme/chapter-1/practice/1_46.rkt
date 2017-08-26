; 1.46

(define (iterative-improve good? improve)
  (lambda (x)
    (define (iter a)
      (let ((next (improve a)))
        (if (good? a next)
            next
            (iter next))))
    (iter x)))

(define (sqrt-t source)
  (define good-enough?
    (lambda (x y)
      (< (abs (- x y)) 0.0001)))
  (define average
    (lambda (x y) (/ (+ x y) 2)))
  (define sqrt-improve
    (lambda (guess)
      (average guess (/ source guess))))
  ((iterative-improve good-enough? sqrt-improve) 1.0))

(sqrt-t 4)


(define (fixed-point f first-guess)
  (define good-enough?
    (lambda (x y)
      (< (abs (- x y)) 0.0001)))
  (define (improve x)
    (f x))
  ((iterative-improve good-enough? improve) first-guess))

(fixed-point cos 1)