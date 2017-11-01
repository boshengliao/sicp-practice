; 3.36

#|

(define a (make-connector)) 和 (define b (make-connector))
会从全局环境中生成环境 E1 和 E2.
然后从全局环境 (set-value! a 10 'user) 中执行它的体,
set-value! 的体, 则是基于 E1 环境.
最后从 E1 环境中执行 for-each-except 的体.

|#