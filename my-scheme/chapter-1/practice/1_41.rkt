; 1.41

(define (double x)
  (lambda (y) (x (x y))))

((double (lambda (x) (+ x 1))) 1)

((lambda (x) (+ x 1)) 1)

(define inc (lambda (x) (+ x 1)))

((double inc) 1)

(((double (double double)) inc) 5)