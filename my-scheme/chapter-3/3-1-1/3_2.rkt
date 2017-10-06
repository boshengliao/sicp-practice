; 3.2

(define (make-monitored func)
  (let ((counts 0))
    (define (dispatch m)
      (cond ((eq? m 'how-many-calls?) counts)
            ((eq? m 'reset-count) (set! counts 0)
                                  counts)
            ((number? m) (set! counts (+ counts 1))
                         (func m))))
    dispatch))

(define s (make-monitored sqrt))

(s 10000)
(s 100)
(s 'how-many-calls?)
(s 'reset-count)