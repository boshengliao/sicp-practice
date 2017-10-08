; 3.9

;; example
(define (factorial n)
  (if (= n 1)
      1
      (* n (factorial (- n 1)))))

#|
创建一个环境 (factorial 6), 将它的参数约束为6, 并求它的体,
然后根据 = 建立环境并求值, 对 = 的结果进行判断, 然后根据 * 建立新
环境, 求值...
|#

(define (factorial n)
  (fact-iter 1 1 n))

(define (fact-iter product counter max-count)
  (if (> counter max-count)
      product
      (fact-iter (* product counter)
                 (+ counter 1)
                 max-count)))

#|
创建一个环境 (factorial 6), 将它的参数约束为6, 并求它的体,
然后根据 fact-iter 建立环境并求值, 对 > 的结果进行判断, 然后
根据 fact-iter 建立新环境, 求值...
|#