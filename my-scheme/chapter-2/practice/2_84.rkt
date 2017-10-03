; 2.84

(load "../instance/2_4_2.rkt")
(load "2_83.rkt")

(define (get-num target x)
#|
  (cond ((null? target) (display "empty target"))
        ((null? x) (display "invalid source"))
        ((number? x)
         (get-num target
                  (attach-tag 'scheme-number x))))
|#
  (let ((s1 (car x)))
    (define (iter a b)
      (let ((v1 (car a)))
        (if (eq? v1 s1)
            b
            (iter (cdr a) (+ b 1)))))
    (iter target 0)))

(define test-list '(a b c d))

(get-num test-list '(d 54))


;;;;
(define (test value1 value2)
  (let ((source-types '(scheme-number
                        rational
                        real-number
                        complex)))
    (let ((num1 (get-num source-types value1))
          (num2 (get-num source-types value2)))
      (cond ((< num1 num2) (test (raise value1) value2))
            ((> num1 num2) (test value1 (raise value2)))
            ((= num1 num2) (list value1 value2))))))

(define v1 (cons 'complex (cons 1 2)))
(define v2 (cons 'scheme-number 1))

(test v1 v2)