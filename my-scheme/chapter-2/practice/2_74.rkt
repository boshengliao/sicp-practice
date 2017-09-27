; 2.74

;; a)
(put 'get-record '(独立机构名) 函数)
; 加入 tag 获取目标机构的记录
(define (get-record company)
  (apply (get 'get-record company)))

;; b)
;加入 tag 用机构的所有记录作为参数, 应用到查找某人薪金的过程上
(define (get-salary comany person)
  (apply (get 'get-salary person)
         (get 'get-record compay)))

;; c)
;获取目标人的过程, 然后遍历所有机构的记录, 返回正确的值
(define (find-employee-record companys person)
  (map (lambda (x)
         (apply (get 'get-record x) person))
       companys))