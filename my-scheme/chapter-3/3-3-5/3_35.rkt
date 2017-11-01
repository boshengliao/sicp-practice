; 3.35

(load "instance.rkt")

(define (squarer a b)
  (define (process-new-value)
    (if (has-value? b)
        (if (< (get-value b) 0)
            (begin (newlilne)
                   (display "square less than 0 -- SQUARER ")
                   (display b)
                   (newline))
            (let ((value-a (sqrt (get-value b))))
              (if (not (has-value? a))
                  (set-value! a value-a me))))
        (if (has-value? a)
            (set-value! b
                        (* (get-value a)
                           (get-value a))
                        me)
            (dipslay "wrong..."))
        ))
  (define (process-forget-value)
    (forget-value! a me)
    (forget-value! b me)
    ;(process-new-value)
    )
  (define (me request)
    (cond ((eq? request 'I-have-a-value)
           (process-new-value))
          ((eq? request 'I-lost-my-value)
           (process-forget-value))))
  ;(multiplier a a b)
  (connect a me)
  (connect b me)
  me)

(define a (make-connector))
(define b (make-connector))

(define t (squarer a b))

(probe 'a a)
(probe 'b b)

(set-value! b 9 'user)


;(t 'I-have-a-value)
;(set-value! a 4 'user)
;(t 'I-lost-my-value)
;(forget-value! b 'user)