; 2.20

(define (same-parity . x)
  (define (iter a b)
    (let ((il (length x)))
      (display a)
      (if (> (+ a 1) il)
          b
          (iter (+ a 2)
                (append b (list (list-ref x a)))))))
  (iter 0 (list)))

(same-parity 1 2 3 4 5 6 7)
(same-parity 2 3 4 5 6 7)