; 2.68

(load "../instance/2_3_3.rkt")
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

(define (encode-symbol-old x tree)
  (cond ((eq? x 'a) '(0))
        ((eq? x 'b) '(1 0))
        ((eq? x 'c) '(1 1 1))
        ((eq? x 'd) '(1 1 0))
        (else (error "wrong str" x))))

(define (encode-symbol smb tree) 
  (define (branch-correct? branch) 
    (if (leaf? branch) 
        (equal? smb (symbol-leaf branch)) 
        (element-of-set? smb (symbols branch)))) 
  
  (let ((lb (left-branch tree)) 
        (rb (right-branch tree))) 
    (cond ((branch-correct? lb) 
           (if (leaf? lb) '(0) (cons 0 (encode-symbol smb lb)))) 
          ((branch-correct? rb) 
           (if (leaf? rb) '(1) (cons 1 (encode-symbol smb rb)))) 
          (else (error "bad symbol -- ENCODE-SYMBOL" bit)))))

(encode '(a d a b b c a) sample-tree)