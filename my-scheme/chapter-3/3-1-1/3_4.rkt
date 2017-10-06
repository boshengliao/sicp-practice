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
    (cond ((not (is-correct-pw? p))
           check-wrong-times)
          ((eq? m 'withdraw)
           (set! wrong-times 0)
           withdraw)
          ((eq? m 'deposit)
           (set! wrong-times 0)
           deposit)
          (else (error
                 "Unknown request -- MAKE-ACCOUNT"
                 m))))
   
  (define call-the-cops
    ((lambda (x) "cops are coming!") 0))
   
  (define (is-correct-pw? p)
    (if (not (eq? p password))
        (begin (set! wrong-times (+ wrong-times 1))
               #f)
        (begin (set! wrong-times 0)
               #t)))

  (define wrong-times 0)
  (define check-wrong-times
    (lambda (x)
      (if (>= wrong-times 7)
          call-the-cops
          (begin
            (display wrong-times)
            (newline)
            "error password!"))))

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