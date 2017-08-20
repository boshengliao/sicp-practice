; 1.33

; 递归计算过程
(define (filtered-accumulate combiner
                             null-value
                             term
                             a
                             next
                             b
                             valid?)
  (if (> a b)
      null-value
      (combiner (if (valid? a)
                    (term a)
                    null-value)
                (filtered-accumulate combiner
                                     null-value
                                     term
                                     (next a)
                                     next
                                     b
                                     valid?))))

; 迭代计算过程
(define (filtered-accumulate-iter combiner
                                  null-value
                                  term
                                  a
                                  next
                                  b
                                  valid?)
  (define (iter x y)
    (if (> x b)
        y
        (iter (next x) (combiner y (if (valid? x)
                                       (term x)
                                       null-value)))))
  (iter a null-value))

(define (next x)
  (+ x 1))

(define (square x)
  (* x x))

(define (smallest-divisor n)
  (find-divisor n 2))

(define (find-divisor n test-divisor)
  (cond ((> (square test-divisor) n) n)
        ((divides? test-divisor n) test-divisor)
        (else (find-divisor n (+ test-divisor 1)))))

(define (divides? a b)
  (= (remainder b a) 0))

(define (prime? n)
  (= n (smallest-divisor n)))

; a 到 b 之间素数之和
; 递归计算过程
(define (f-a a b)
  (filtered-accumulate + 0 (lambda (x) x) a next b prime?))

; 迭代计算过程
(define (f-a-iter a b)
  (filtered-accumulate-iter +
                            0
                            (lambda (x) x)
                            a
                            next
                            b
                            prime?))

(f-a 1 10)
(f-a-iter 1 10)



(define (com-gcd? x y)
  (if (and (< x y) (= (gcd x y) 1))
      #t
      #f))

; 计算 1 到 a 之间互素之积
; 递归计算过程
(define (f-p a)
  (filtered-accumulate *
                       1
                       (lambda (x) x)
                       1
                       next
                       a
                       (lambda (x) (com-gcd? x a))))

; 迭代计算过程
(define (f-p-iter a)
  (filtered-accumulate-iter *
                            1
                            (lambda (x) x)
                            1
                            next
                            a
                            (lambda (x) (com-gcd? x a))))

(f-p 10)
(f-p-iter 10)