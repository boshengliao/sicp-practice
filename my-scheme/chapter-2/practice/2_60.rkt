; 2.60

; 这个过程, 效率变低了, 因为需要遍历所有元素
(define (element-of-set? x set)
  (define (iter a c)
    (cond ((null? a) c)
          ((equal? x (car a)) (iter (cdr a) (+ c 1)))
          (else (iter (cdr a) c))))
  (iter set 0))

(define t (list 1 2))
(cddr t)
(element-of-set? 1 (list 1 2 1))


; 效率高了, 因为无需判断是否重复
(define (adjoin-set x set)
  (cons x set))

(adjoin-set 1 (list 1 2 3))


; 效率低了, 因为每次添加都要遍历 set2 所有元素
(define (intersection-set set1 set2)
  (cond ((or (null? set1) (null? set2)) '())
        ((> (element-of-set? (car set1) set2) 0)
         (cons (car set1)
               (intersection-set (cdr set1) set2)))
        (else (intersection-set (cdr set1) set2))))

(intersection-set (list 4 1 2 3 2) (list 2 2 3 4))


; 效率高了, 直接合并, 无需判断重复
(define (union-set set1 set2)
  (cond ((and (null? set1) (null? set2)) '())
        ((null? set1) set2)
        ((null? set2) set1)
        (else (cons (car set1)
                    (union-set (cdr set1) set2)))))

(union-set (list 2 3 5) (list 8 8 8))

; 在做统计方面的应用时, 会更倾向使用有重复数据的表示