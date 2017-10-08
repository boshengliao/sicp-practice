; 3.10

(define W1 (make-withdraw 100))
(define W2 (make-withdraw 100))

#|
w1 和 w2 的求值表达式相同, 但是其执行的环境是相互独立的.
因此结果互不影响.
|#