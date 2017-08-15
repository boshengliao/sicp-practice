; 1.11
(define (t x)
  (cond ((< x 3) x)
        (else (+ (t (- x 1))
                 (* 2 (t (- x 2)))
                 (* 3 (t (- x 3)))))))

(t 10)

; 线性迭代计算过程的思想是: 参数 保存结果 保存计数,
; 满足三个要求就OK了
(define (t2 x)
  (define tt0 0)
  (define tt1 1)
  (define tt2 2)
  (define (tt3 a b c r count)
    (if (= count x)
        r
        (tt3 (+ (* 1 a)
                (* 2 b)
                (* 3 c))
             a
             b
             (+ (* 1 a)
                (* 2 b)
                (* 3 c))
             (+ count 1))))
  (if (< x 3)
      x
      (tt3 2 1 0 0 2)))

(t2 10)
