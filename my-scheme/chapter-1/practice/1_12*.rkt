; 1.12
(define (r x)
  (define (ct a b c d)
    (cond ((or (= c 1) (= c d)) (display "1"))
          ((= c (+ d 1)) (display "\n"))
          ((= c (+ d 2) (ct ))
          (else (+ a b))))
  (ct 1 1 1 1))