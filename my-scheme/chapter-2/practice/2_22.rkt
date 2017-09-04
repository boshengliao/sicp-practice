; 2.22


(define (square x)
  (* x x ))

(define (square-list items)
  (define (iter things answer)
    (if (null? things)
        answer
        (iter (cdr things)
              (cons (square (car things))
                    answer))))
  (iter items (list)))

(square-list (list 2 4 5))

(define (square-list-1 items)
  (define (iter things answer)
    (if (null? things)
        answer
        (iter (cdr things)
              (cons answer
                    (square (car things))))))
  (iter items (list)))

(square-list-1 (list 2 4 5))

#|
结果跟 cons 的特性有关, 一般 cons 只能往低处添加新值,
如果添加值在位高处, 则会出现多重括号的形式
|#
(define (square-list-2 items)
  (define (iter things answer)
    (if (null? things)
        answer
        (iter (cdr things)
              (append answer
                    (list (square (car things)))))))
  (iter items (list)))

(square-list-2 (list 2 4 5))