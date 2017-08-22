; 1.39

; 递归计算过程
(define (tan-cf x k)
  (define (func f a b c d e)
    (/ a (- b (f c d e))))
  (define (iter a b r)
    (let ((v1 1)
          (a2 (* a a))
          (next-b (+ b 1))
          (even-r (+ r 2)))
#|      (display " ")
      (display "b ")
      (display b)
      (display " ")
      (display "even-r ")
      (display even-r)
      (newline)|#
      (cond ((> b k) 0)
            ((= b 1) (func iter
                           a
                           b
                           a
                           next-b
                           r))
            (else (func iter
                        a2
                        even-r
                        a
                        next-b
                        (+ r 2))))))
  (exact->inexact (iter x 1 1)))

(tan 25)
(tan-cf 25 100)