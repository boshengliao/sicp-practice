; 3.19

(load "3_12.rkt")
(load "3_17.rkt")

(define (make-cycle x)
  (set-cdr! (last-pair x) x)
  x)

(define z (make-cycle (list 'a 'b 'c)))

(define (cycle? x)
  (cond ((null? x) #f)
        ((pair? (car x))
         (eq? (caar x) 'cycle))
        (else (set-identify x))))

(define (set-identify x)
  (set-car! x (cons 'cycle (car x)))
  (cycle? (cdr x)))

(cycle? (list 1 2 4))
(cycle? z)

;;
(define (cycle?1 x)
  (define (iter a b)
    (if (or (null? a)
            (null? b))
        #f
        (let ((m1 (car a))
              (m2 (cadr b))
              (v1 (cdr a))
              (v2 (cddr b)))
          (cond ((or (null? m1)
                     (null? m2))
                 #f)
                ((eq? m1 m2) #t)
                (else (iter v1 v2))))))
  (iter x x))

;(cycle?1 (list 1 2 4))
(cycle?1 z)