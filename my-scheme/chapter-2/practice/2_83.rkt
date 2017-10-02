; 2.83

(define (raise x)
  (let ((type (car x)))
    (let ((s1 (eq? type 'complex))
          (s2 (eq? type 'real-number))
          (s3 (eq? type 'rational))
          (s4 (eq? type 'scheme-number))
          (value (contents x)))
      (cond (s1 x)
            (s2 (attach-tag 'complex
                            (attach-tag 'rectangular
                                        (cons value 0))))
            (s3 (attach-tag 'real-number
                            (/ (number value)
                               (denom value))))
            (s4 (attach-tag 'rational (cons value 1)))))))