; 2.84

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