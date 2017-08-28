; 2.6

(define zero (lambda (f) (lambda (x) x)))

(define (add-1 n)
  (lambda (f) (lambda (x) (f ((n f) x)))))

; 展开 add-1 zero
(add-1 zero)

(add-1 (lambda (f) (lambda (x) x)))

(lambda (f)
  (lambda (x)
    (f (((lambda (f) (lambda (x) x)) f) x))))

(lambda (f)
  (lambda (x)
    (f ((lambda (x) x) x))))

(lambda (f)
  (lambda (x)
    (f x)))

; one
(define one
  (lambda (f)
    (lambda (x)
      (f x))))

; add-1 one 展开
(add-1 one)

(add-1 (lambda (f) (lambda (x) (f x))))

(lambda (f)
  (lambda (x)
    (f (((lambda (f) (lambda (x) (f x))) f) x))))

(lambda (f)
  (lambda (x)
    (f ((lambda (x) (f x)) x))))

(lambda (f)
  (lambda (x)
    (f (f x))))

; two
(define two
  (lambda (f)
    (lambda (x)
      (f (f x)))))

; two + two 展开
(lambda (f)
  (lambda (x)
    (f (f x))) (f (f x)))

(lambda (f)
  (lambda (x)
    (f (f (f (f x))))))

; + 函数
(define +
  (lambda (m)
    (lambda (n)
      (lambda (f)
        (lambda (x)
          (m f (n f x)))))))