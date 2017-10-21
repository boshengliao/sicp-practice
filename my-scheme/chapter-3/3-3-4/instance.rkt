; 3.3.4

(define a (make-write))
(define b (make-write))
(define c (make-write))

(define d (make-write))
(define e (make-write))
(define f (make-write))

(or-gate a b d)

(and-gate a b c)

(inverter c e)

(and-gate d e s)

(define (half-adder a b s c)
  (let ((d (make-write)) (e (make-write)))
    (or-gate a b d)
    (and-gate a b c)
    (inverter c e)
    (and-gate d e s)
    'ok))

(define (full-adder a b c-in sum c-out)
  (let ((s (make-write))
        (c1 (make-write))
        (c2 (make-write)))
    (half-adder b c-in s c1)
    (half-adder a s sum c2)
    (or-gate c1 c2 c-out)
    'ok))

(define (inverter input output)
  (define (invert-input)
    (let ((new-value (logical-not (get-signal input))))
      (after-delay inverter-delay
                   (lambda ()
                     (set-signal! output new-value)))))
  (add-action! input invert-input)
  'ok)

(define (logical-not s)
  (cond ((= s 0) 1)
        ((= s 1) 0)
        (else "Invalid signal")))

(define (and-gate a1 a2 output)
  (define (and-action-procedure)
    (let ((new-value
           (logical-and (get-signal a1) (get-signal a2))))
      (after-delay and-gate-delay
                   (lambda ()
                     (set-signal! output new-value)))))
  (add-action! a1 and-action-procedure)
  (add-action! a2 and-action-procedure)
  'ok)

(define (logical-and a b)
  (cond ((and (= a 1) (= b 1) 1))
        ((or (= a 0) (= b 0)) 0)
        (else "Invalid value")))