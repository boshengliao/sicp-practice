; 2.2.2

(define (count-leaves x)
  (cond ((null? x) 0)
        ((not (pair? x)) 1)
        (else (+ (count-leaves (car x))
                 (count-leaves (cdr x))))))

(define x (cons (list 1 2) (list 3 4)))

(display x)

(length x)

(count-leaves x)

(length (list x x))

(count-leaves (list x x))

