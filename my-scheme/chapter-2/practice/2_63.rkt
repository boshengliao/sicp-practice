; 2.63


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


;;;;
(define (tree->list-1 tree)
  (if (null? tree)
      '()
      (append (tree->list-1 (left-branch tree))
              (cons (entry tree)
                    (tree->list-1 (right-branch tree))))))

(define (tree->list-2 tree)
  (define (copy-to-list tree result-list)
    (if (null? tree)
        result-list
        (copy-to-list (left-branch tree)
                      (cons (entry tree)
                            (copy-to-list (right-branch tree)
                                          result-list)))))
  (copy-to-list tree '()))

(define left (make-tree 2 '() '()))

(define right (make-tree 5 '() '()))

(define tree (make-tree 4 left right))

(tree->list-1 tree)
(tree->list-2 tree)

(define tree1 (make-tree 7
                         (make-tree 3
                                    (make-tree 1
                                               '()
                                               '())
                                    (make-tree 5
                                               '()
                                               '()))
                         (make-tree 9
                                    '()
                                    (make-tree 11
                                               '()
                                               '()))))
(define tree2 (make-tree 3
                         (make-tree 1
                                    '()
                                    '())
                         (make-tree 7
                                    (make-tree 5
                                               '()
                                               '())
                                    (make-tree 9
                                               '()
                                               (make-tree 11
                                                          '()
                                                          '())))))
(define tree3 (make-tree 5
                         (make-tree 3
                                    (make-tree 1
                                               '()
                                               '())
                                    '())
                         (make-tree 9
                                    (make-tree 7
                                               '()
                                               '())
                                    (make-tree 11
                                               '()
                                               '()))))

(tree->list-1 tree1)
(tree->list-2 tree1)
(tree->list-1 tree2)
(tree->list-2 tree2)
(tree->list-1 tree3)
(tree->list-2 tree3)

; 两种过程的结果是一样的
; tree->list1 因为是左右分支同时计算, 需要 n**2 步
;(展开即可发现,需要调用6次tree->list, 6次 append, 6次 cons)
; tree->list2 是先对右分支求值, 再遍历左分支, 需要 n 步
;(展开发现, 需要调用6次tree->list, 6次 cons)
; 所以第二种过程增长方式慢一些