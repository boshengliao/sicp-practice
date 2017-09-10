; 2.38

(define (fold-right op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence)
          (fold-right op initial (cdr sequence)))))

(define (fold-left op initial sequence)
  (define (iter result rest)
    (if (null? rest)
        result
        (iter (op result (car rest))
              (cdr rest))))
  (iter initial sequence))

(fold-right / 1.0 (list 1 2 3))

(fold-left / 1.0 (list 1 2 3))

(fold-right list '() (list 1 2 3))

(fold-left list (list) (list 1 2 3))

; 当 op 过程的参数位置变化不影响结果时, right 和 left 的结果相等
(fold-right + 1.0 (list 1 2 3))

(fold-left + 1.0 (list 1 2 3))