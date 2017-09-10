; 2.35

(define (accumulate op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence)
          (accumulate op initial (cdr sequence)))))

(define (count-leaves t)
  (accumulate func
              0
              (map (lambda (x)
                     (if (pair? x)
                         (count-leaves x)
                         1))
                   t)))

(define (func x y)
  (+ x y))

(count-leaves (list 1 2 3 4 (list 5 6) (list 7 8 (list 9 10))))