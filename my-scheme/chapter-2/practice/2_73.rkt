; 2.73

(define (deriv-old exp var)
  (cond ((number? exp) 0)
        ((variable? exp)
         (if (same-variable? exp var) 1 0))
        ((sum? exp)
         (make-sum (deriv (addend exp) var)
                   (deriv (augend exp) var)))
        ((product? exp)
         (make-sum
          (make-product (multiplier exp)
                        (deriv (multiplicand exp) var))
          (make-product (deriv (multiplier exp) var)
                        (multiplicand exp))))
        ;;<更多规则加在这里>
        (else (error "unknown expression type -- DERIV" exp))))


;;;; 改写成数据导向风格
(define (deriv exp var)
  (cond ((number? exp) 0)
        ((variable? exp)
         (if (same-variable? exp var) 1 0))
        (else ((get 'deriv (operator exp))
               (operands exp)
               var))))

(define (operator x) (car x))
(define (operands x) (cdr x))

#|
a) (1)上面用 get 获取标记为 deriv 且带有数据处理类型符号的函数,
   并应用到实际的数据上.
   (2)number? 和 same-variable? 是直接对数据类型的判断, 数
   据导向风格的程序是对<数据处理类型/方式>进行功能分割的.
|#

;; b)
(define (install-sum-package)
  ;;
  (define (do-sum exp var)
    (make-sum (deriv (addend exp) var)
              (deriv (augend exp) var)))
  ;;
  (define (tag x) (attach-tag '+ x))
  (put 'deriv '+
       (lambda (x y) (tag (do-sum x y))))
  'done)

(define (install-product-package)
  ;;
  (define (do-product exp var)
    (make-sum
     (make-product (multiplier exp)
                   (deriv (multiplicand exp) var))
     (make-product (deriv (multiplier exp) var)
                   (multiplicand exp))))
  ;;
  (define (tag x) (attach-tag '* x))
  (put 'deriv '*
       (lambda (x y) (tag (do-product x y))))
  'done)