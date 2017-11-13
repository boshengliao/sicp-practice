; 3.47
#|
(define (make-mutex)
  (let ((cell (list #f)))
    (define (the-mutex m)
      (cond ((eq? m 'acquire)
             (if (test-and-set! cell)
                 (the-mutex 'acquire)))
            ((eq? m 'release) (clear! cell))))
    the-mutex))
|#

(define (make-mutex n)
  (let ((cells (cells-iter n)))
    (define (the-mutex m)
      (cond ((eq? m 'acquire)
             (if (test-and-set-iter! cell)
                 (the-mutex 'acquire)))
            ((eq? m 'release) (clear! cell))))
    the-mutex))

(define (test-and-set-iter! cells)
  (define (iter a)
    (cond ((null? a) #t)
          ((car a) (iter (cdr a)))
          (else (test-and-set! a))))
  (iter cells))

(define (cells-iter n)
  (define (iter a b)
    (if (< a 1)
        b
        (iter (- a 1) (cons #f b))))
  (iter n (list)))

(cells-iter 4)