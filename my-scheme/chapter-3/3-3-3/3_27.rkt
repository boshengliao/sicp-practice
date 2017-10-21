; 3.27

(define (lookup key table)
  (let ((record (assoc-new key (cdr table))))
    (if record
        (cdr record)
        #f)))

(define (assoc-new key records)
  (cond ((null? records) #f)
        ((equal? key (caar records)) (car records))
        (else (assoc-new key (cdr records)))))

(define (insert! key value table)
  (let ((record (assoc-new key (cdr table))))
    (if record
        (set-cdr! record value)
        (set-cdr! table
                  (cons (cons key value)
                        (cdr table)))))
  'ok)

(define (make-table)
  (list '*table*))

;;
(define (fib n)
  (cond ((= n 0) 0)
        ((= n 1) 1)
        (else (+ (fib (- n 1)
                      (- n 2))))))

(define (memoize f)
  (let ((table (make-table)))
    (lambda (x)
      (let ((previosly-computed-result (lookup x table)))
        (or previosly-computed-result
            (let ((result (f x)))
              (insert! x result table)
              result))))))

(define memo-fib
  (memoize (lambda (n)
             (cond ((= n 0) 0)
                   ((= n 1) 1)
                   (else (+ (memo-fib (- n 1))
                            (memo-fib (- n 2))))))))

(memo-fib 3)

#|

调用 (memo-fib 3) 生成环境 E1, 在 E1 环境中的体是 (memoize f),
且参数是 3, 执行 (memoize f) 生成环境 E2, 在其中生成了一张表和返回了
一个过程, 这个过程接受了 E1 环境的参数, 且在 E2 环境中执行过程.
因此值在 E2 环境中得到计算和保存.

未完待续...

|#