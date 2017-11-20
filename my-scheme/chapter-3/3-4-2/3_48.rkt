; 3.48

(define (make-account-and-serializer balance num)
  (define (withdraw amount)
    (if (>= balance amount)
        (begin (set! balance (- balance amount))
               balance)
        "Insufficient funds"))
  (define (deposit amount)
    (set! balance (+ balance amount))
    balance)
  (let ((balance-serializer (make-serializer)))
    (define (dispatch m)
      (cond ((eq? m 'withdraw)  withdraw)
            ((eq? m 'deposit) deposit)
            ((eq? m 'balance) balance)
            ((eq? m 'serializer) balance-serializer)
            ((eq? m 'num) num)
            (else (display "Unknown request -- MAKE-ACCOUNT ")
                  (display m)
                  (newline)))))
  dispatch)

(define (serializered-exchange account1 account2)
  (let ((num1 (account1 'num))
        (num2 (account2 'num)))
    (let ((serializer1 (account1 'serializer))
          (serializer2 (account2 'serializer)))
      (if (< num1 num2)
          ((serializer2 (serializer1 exchange))
           account1
           account2)
          ((serializer1 (serializer2 exchange))
           account1
           account2)))))