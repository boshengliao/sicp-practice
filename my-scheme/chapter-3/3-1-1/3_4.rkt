; 3.4

(define (make-account balance password)
  (define (withdraw amount)
    (if (>= balance amount)
        (begin (set! balance (- balance amount))
               balance)
        "Insufficient funds"))
  (define (deposit amount)
    (set! balance (+ balance amount))
    balance)
  (define (dispatch m p)
    (cond ((not (eq? p password))
           (set! wrong-times (+ wrong-times 1))
           (if (>= wrong-times 7)
               call-the-cops
               (lambda (x)
                 (display wrong-times)
                 (newline)
                 "error password!")))
          ((eq? m 'withdraw)
           (set! wrong-times 0)
           withdraw)
          ((eq? m 'deposit)
           (set! wrong-times 0)
           deposit)
          (else (error
                 "Unknown request -- MAKE-ACCOUNT"
                 m))))
  (define wrong-times 0)
  (define call-the-cops
    (lambda (x) "cops are coming!"))
  dispatch)

(define a (make-account 100 '123))

((a 'withdraw '123) 10)

((a 'withdraw '1234) 10)
((a 'withdraw '1234) 10)
((a 'withdraw '1234) 10)
((a 'withdraw '1234) 10)
((a 'withdraw '1234) 10)

((a 'withdraw '123) 10)

((a 'withdraw '1234) 10)
((a 'withdraw '1234) 10)
((a 'withdraw '1234) 10)
((a 'withdraw '1234) 10)
((a 'withdraw '1234) 10)
((a 'withdraw '1234) 10)
((a 'withdraw '1234) 10)