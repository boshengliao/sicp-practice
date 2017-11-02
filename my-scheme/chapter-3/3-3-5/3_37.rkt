; 3.37

(load "instance.rkt")
;;
(define (divider m1 m2 division)
  (define (process-new-value)
    (cond ((or (and (has-value? m1) (= (get-value m1) 0)))
           (set-value! division 0 me))
          ((and (has-value? m1) (has-value? m2))
           (set-value! division
                       (/ (get-value m1) (get-value m2))
                       me))
          ((and (has-value? division) (has-value? m1))
           (set-value! m2
                       (/ (get-value m1) (get-value division))
                       me))
          ((and (has-value? division) (has-value? m2))
           (set-value! m1
                       (* (get-value division) (get-value m2))
                       me))
          ((and (not (has-value? m1))
                (not (has-value? m2)))
           (newline)
           (display "Neither m1 & m2 no value!"))))
  (define (process-forget-value)
    (forget-value! division me)
    (forget-value! m1 me)
    (forget-value! m2 me)
    (process-new-value))
  (define (me request)
    (cond ((eq? request 'I-have-a-value)
           (process-new-value))
          ((eq? request 'I-lost-my-value)
           (process-forget-value))
          (else (begin
                  (display "Unknown request -- DIVIDER")
                  request))))
  (connect m1 me)
  (connect m2 me)
  (connect division me)
  me)

;;
(define (c+ x y)
  (let ((z (make-connector)))
    (adder x y z)
    z))

(define (c* x y)
  (let ((z (make-connector)))
    (multiplier x y z)
    z))

(define (c/ x y)
  (let ((z (make-connector)))
    (divider x y z)
    z))

(define (cv x)
  (let ((z (make-connector)))
    (constant x z)
    z))
;;
(define (celsius-fahrenheit-converter x)
  (c+ (c/ (c* (cv 9) (cv 5))
          x)
      (cv 32)))

(define C (make-connector))
(define F (celsius-fahrenheit-converter C))

(get-value F)

(set-value! C 2 'user)
(get-value F)