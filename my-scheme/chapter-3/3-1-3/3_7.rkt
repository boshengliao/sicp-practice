; 3.7

(define (make-account balance password)
  (define (withdraw amount)
    (if (>= balance amount)
        (begin (set! balance (- balance amount))
               balance)
        "Insufficient funds"))
  
  (define (deposit amount)
    (set! balance (+ balance amount))
    balance)
  
  (define (identify v)
    (if (eq? v password)
        #t
        #f))
  
  (define (set-new-account new)
    (lambda (m p)
      (if (eq? p new)
          (dispatch m password)
          "password wrong!")))
  
  (define (dispatch m p)
    (cond ((not (eq? p password))
           (lambda (p) "error password!"))
          ((eq? m 'withdraw) withdraw)
          ((eq? m 'deposit) deposit)
          ((eq? m 'set-new-account) set-new-account)
          (else (error
                 "Unknown request -- MAKE-ACCOUNT"
                 m))))
  
  dispatch)

(define a (make-account 100 '123))

;;
(define (make-joint account old new)
  ((account 'set-new-account old) new))

(define b (make-joint a '123 '111))

((b 'withdraw '111) 10)
((a 'withdraw '123) 10)
((a 'withdraw '123) 10)

((b 'deposit '111) 30)
((a 'withdraw '123) 0)