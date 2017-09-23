; 2.66

(define (entry tree)
  (car tree))

(define (left-branch tree)
  (cadr tree))

(define (right-branch tree)
  (caddr tree))

(define (make-tree entry left right)
  (list entry left right))

(define (element-set?-new1 x tree)
  (cond ((null? tree) #f)
        ((< x (entry tree))
         (element-set?-new1 x (left-branch tree)))
        ((= x (entry tree)) #t)
        (else (element?-set?-new1 x (right-branch tree)))))

;;;;
(define (lookup x tree)
  (cond ((null? tree) #f)
        ((< x (entry tree))
         (lookup x (left-branch tree)))
        ((= x (entry tree)) tree)
        (else (lookup x (right-branch tree)))))

(define tree (list 5
                   (list 1 '() (list 3 '() '()))
                   (list 9
                         (list 7 '() '())
                         (list 11 '() '()))))

(lookup 5 tree)