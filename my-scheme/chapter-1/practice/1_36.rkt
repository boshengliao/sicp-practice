; 1.36

(define (close-enough? x y)
  (< (abs (- x y)) 0.001))

(define (average x y)
  (/ (+ x y) 2))

(define tolerance 0.00001)

(define (fixed-point f first-guess)
  (define (close-enough? v1 v2)
    (< (abs (- v1 v2)) tolerance))
  (define (try guess step)
    (let ((next (f guess)))
      (display step)
      (newline)
      (if (close-enough? guess next)
          next
          (try next (+ step 1)))))
  (try first-guess 1))

; 平均阻尼
(fixed-point (lambda (x) (average x (/ (log 1000)
                                       (log x))))
             2.0)

; 非平均阻尼
(fixed-point (lambda (x) (/ (log 1000)
                            (log x)))
             2.0)