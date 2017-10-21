; 3.28

(define (or-gate a1 a2 output)
  (define (or-action-procedure)
    (let ((new-value
           (logical-not (get-signal a1) (get-signal a2))))
      (after-delay or-gate-delay
                   (lambda ()
                     (set-signal! output new-value)))))
  (add-action! a1 or-action-procedure)
  (add-action! a2 or-action-procedure)
  'ok)

(define (logical-not a b)
  (cond ((or (= a 1) (= b 1)) 1)
        ((and (= a 0) (= b 0) 0))
        (else "Invalid value")))