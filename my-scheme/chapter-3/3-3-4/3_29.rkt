; 3.29


(define (or-gate a1 a2 output)
  (let ((v1 (logical-not a1))
        (v2 (logical-not a2)))
    (and-gate v1 v2 output)))