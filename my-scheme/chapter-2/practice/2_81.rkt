; 2.81

#|

a)对两个 complex 调动 apply-generic 会进入无限循环.

b)louis 并没有纠正类型参数强制问题. apply-generic 已经无法正常工作了.

|#

;; c)

(define (apply-generic op . args)
  (let ((type-tags (map type-tag args)))
    (let ((proc (get op type-tags)))
      (if proc
          (apply proc (map contents args))
          (if (= (length args) 2)
              (let ((type1 (car type-tags))
                    (type2 (cadr type-tags))
                    (a1 (car (args)))
                    (a2 (cadr (args))))
                (let ((t1->t2 (get-coercion type1 type2))
                      (t2->t1 (get-coercion type2 type1))
                      ;判断类型是否相等, 相等则抛出错误
                      (equal-type (eq? type1 type2)))
                  (if equal-type
                      (error "No method for these types"
                                (list op type-tags))
                  (cond (equal-type
                         ((get op type-tags) a1 a2))
                        (t1->t2
                         (apply-generic op (t1->t2 a1) a2))
                        (t2->t1
                         (apply-generic op a1 (t2->t1 a2)))
                        (else
                         (error "No method for these types"
                                (list op type-tags)))))))))
      (error "No method for these types"
             (list op type-tags)))))