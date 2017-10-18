; 3.25

(define (make-table)
  (let ((local-table (list '*table*)))
    (define (lookup key)
      (let ((record (assoc key (cdr local-table))))
        (if record
            (cdr record)
            #f)))
    
    (define (lookup-new keys)
      (define (iter a r)
        (if (null? a)
            r
            (let ((record (assoc (car a)
                                 (cdr local-table))))
              (cond (record
                     (iter (cdr a)
                           (append r (list (cdr record)))))
                    (else (iter (cdr a)
                                r))
                    ))))
      (iter keys '()))
    
    (define (assoc key records)
      (cond ((null? records) #f)
            ((equal? key (caar records)) (car records))
            (else (assoc key (cdr records)))))

    (define (insert!-new keys value)
      (define (iter a v)
        (if (null? a)
            'ok
            (let ((record (assoc (car a)
                                 (cdr local-table))))
              (cond (record (set-cdr! record value))
                    (else
                     (set-cdr! local-table
                      (cons (cons (car a) value)
                            (cdr local-table)))
                     (iter (cdr a) v))
                    ))))
      (iter keys value))
    
    (define (insert! key value)
      (let ((record (assoc key (cdr local-table))))
        (if record
            (set-cdr! record value)
            (set-cdr! local-table
                      (cons (cons key value)
                            (cdr local-table)))))
      'ok)

    (define (dispatch m)
      (cond ((eq? m 'lookup-proc) lookup-new)
            ((eq? m 'insert-proc!) insert!-new)
            (else "Unknown operation -- TABLE")))
    dispatch))

(define tt (make-table))
(define get (tt 'lookup-proc))
(define put (tt 'insert-proc!))

(put (list 1 2 3 4 5) 11)
(get (list 1 4 5))