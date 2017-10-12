; 3.17

(define (count-pairs-old x)
  (if (not (pair? x))
      0
      (+ (count-pairs-old (car x))
         (count-pairs-old (cdr x))
         1)))

;;
(define (count-pairs x)
  (length (count x '())))

(define (count x all-cons)
  (if (and (pair? x)
           (false? (in-list? x all-cons)))
      (count (car x)
             (count (cdr x)
                    (cons x all-cons)))
      all-cons))

(define (false? x)
  (if (eq? x #f)
      #t
      #f))

(define (in-list? x all-list)
  (cond ((null? all-list) #f)
        ((eq? x (car all-list)) #t)
        (else (in-list? x (cdr all-list)))))

(count-pairs-old (list 1 2 3))

(count-pairs (list 1 2 3))

(define a (cons 'a 'b))
(define b (cons a a))

(count-pairs-old b)
(count-pairs b)
(count-pairs (cons (cons 1 2) (cons 3 4)))