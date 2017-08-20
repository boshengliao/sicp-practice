; 1.32

; 递归计算过程
(define (accumulate combiner
                    null-value
                    term
                    a
                    next
                    b)
  (if (> a b)
      null-value
      (combiner (term a)
                (accumulate combiner
                            null-value
                            term
                            (next a)
                            next
                            b))))

; 迭代计算过程
(define (accumulate-iter combiner
                         null-value
                         term
                         a
                         next
                         b)
  (define (iter x y)
    (if (> x b)
        y
        (iter (next x) (combiner y (term x)))))
  (iter a null-value))

(define (term-p x)
  (if (or (= x 0)
          (not (odd? x)))
      (/ (+ x 2.0)
         (+ x 3.0))
      (/ (+ x 3.0)
         (+ x 2.0))))

(define (next x)
  (+ x 1))

(accumulate * 1 term-p 0.0 next 100000)
(accumulate-iter * 1 term-p 0.0 next 10000000)
