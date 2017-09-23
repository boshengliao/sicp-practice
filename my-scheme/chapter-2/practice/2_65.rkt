; 2.65

(load "2_62.rkt")
(load "2_63.rkt")
(load "2_64.rkt")

(define (union-tree tree1 tree2)
  (let ((list1 (tree->list-2 tree1))
        (list2 (tree->list-2 tree2)))
    (let ((list3 (union-set list1 list2)))
      (list->tree list3))))

(define t1 (list 3 (list 1 '() '()) (list 7 '() '())))
(define t2 (list 9 (list 5 '() '()) (list 11 '() '())))

(union-tree t1 t2)


(define (intersection-set-new set1 set2)
  (if (or (null? set1) (null? set2))
      '()
      (let ((x1 (car set1))
            (x2 (car set2)))
        (cond ((= x1 x2)
               (cons x1
                     (intersection-set-new (cdr set1)
                                           (cdr set2))))
              ((< x1 x2)
               (intersection-set-new (cdr set1) set2))
              ((> x1 x2)
               (intersection-set-new set1 (cdr set2)))))))

(define (intersection-tree tree1 tree2)
  (let ((list1 (tree->list-2 tree1))
        (list2 (tree->list-2 tree2)))
    (let ((list3 (intersection-set-new list1 list2)))
      (list->tree list3))))

(define t3 (list 5 (list 1 '() '()) (list 6 '() '())))
(define t4 (list 6 (list 1 '() '()) (list 7 '() '())))

(intersection-tree t3 t4)