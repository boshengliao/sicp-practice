; 2.68

(load "../instance/2_3_4.rkt")

(define sample-tree
  (make-code-tree (make-leaf 'A 4)
                  (make-code-tree (make-leaf 'B 2)
                                  (make-code-tree (make-leaf 'D 1)
                                                  (make-leaf 'C 1)))))

(define sample-message
  '(0 1 1 0 0 1 0 1 0 1 1 1 0))

;(decode sample-message sample-tree)
;(a d a b b c a)

;;;;;
(define (encode message tree)
  (if (null? message)
      '()
      (append (encode-symbol (car message) tree)
              (encode (cdr message) tree))))

(define (encode-symbol x tree)
  (cond ((eq? x 'a) '(0))
        ((eq? x 'b) '(1 0))
        ((eq? x 'c) '(1 1 1))
        ((eq? x 'd) '(1 1 0))
        (else (error "wrong str" x))))

(encode '(a d a b b c a) sample-tree)
