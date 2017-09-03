; 2.19

(define us-coins (list 50 25 10 5 1))
(define uk-coins (list 100 50 20 10 5 2 1 0.5))
(define us-coins-2 (list 1 25 10 50 5))
(define uk-coins-2 (list 50 20 10 100 5 2 1 0.5))

(define (cc amount coin-values)
  (cond ((= amount 0) 1)
        ((or (< amount 0) (no-more? coin-values)) 0)
        (else
         (+ (cc amount
                (except-first-denomination coin-values))
            (cc (- amount
                   (first-denomination coin-values))
                coin-values)))))

(define (except-first-denomination x)
  (cdr x))

(define (first-denomination x)
  (car x))

(define (no-more? x)
  (let ((v (length x)))
    (if (= v 0)
        #t
        #f)))

(cc 100 us-coins)
(cc 100 us-coins-2)
(cc 100 uk-coins)
(cc 100 uk-coins-2)

; coins-values 的顺序不会影响结果,