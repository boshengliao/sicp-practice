; 2.3.3

(define (element-of-set? x set)
  (cond ((null? set) #f)
        ((equal? x (car set)) #t)
        (else (element-of-set? x (cdr set)))))

(define (adjoin-set x set)
  (if (element-of-set? x set)
      set
      (cons x set)))

(define (intersection-set set1 set2)
  (cond ((or (null? set1) (null? set2)) '())
        ((element-of-set? (car set1) set2)
         (cons (car set1)
               (intersection-set (cdr set1) set2)))
        (else (intersection-set (cdr set1) set2))))

(define (element-of-set?-new x set)
  (cond ((null? set) #f)
        ((= x (car set)) #t)
        ((< x (car set)) #f)
        (else (element-of-set?-new x (cdr set)))))

(define (intersection-set-new set1 set2)
  (if (or (null? set1) (null? set2))
      '()
      (let ((x1 (car set1))
            (x2 (car set2)))
        (cond ((= x1 x2)
               (cons x1
                     (intersection-set-new (cdr se1)
                                           (cdr set2))))
              ((< x1 x2)
               (intersection-set-new (cdr set1) set2))
              ((> x1 x2)
               (intersection-set-new set1 (cdr set2)))))))


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

(define (adjoin-set-new1 x set)
  (let ((e (entry set))
        (l (left-branch set))
        (r (right-branch set)))
    (cond ((null? set) (make-tree x '() '()))
          ((< x e) (make-tree e
                              (adjoin-set-new1 x l)
                              r))
          ((= x e) set)
          ((> x e) (make-tree e
                              l
                              (adjoin-set-new1 x r))))))