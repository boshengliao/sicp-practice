; 2.3

(define (for-each-1 x items)
  (let ((l (length items)))
    (define (iter a b)
      (x (car a))
      (if (= b l)
          #t
          (iter (cdr a) (+ b 1))))
    (iter items 1)))

(for-each-1 (lambda (x) (newline) (display x))
          (list 57 321 88))

(for-each (lambda (x) (newline) (display x))
          (list 57 321 88))

(define (for-each-2 x items)
  (cond ((null? items)
         (x (car iterms))
         (for-each-2 x (cdr items)))))

(for-each-2 (lambda (x) (newline) (display x))
          (list 57 321 88))