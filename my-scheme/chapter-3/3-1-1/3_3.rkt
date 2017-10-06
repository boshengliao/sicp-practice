; 3.3

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
           (lambda (p) "error password!"))
          ((eq? m 'withdraw) withdraw)
          ((eq? m 'deposit) deposit)
          (else (error
                 "Unknown request -- MAKE-ACCOUNT"
                 m))))
  dispatch)

(define a (make-account 100 '123))

((a 'withdraw '123) 50)
((a 'withdraw '123) 40)
((a 'withdraw '1234) 50)
((a 'deposit '123) 60)