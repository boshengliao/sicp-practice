; 3.25

(define (make-table)
  (let ((local-table (list '*table*)))
    (define (lookup keys)
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

    (define (insert! keys value)
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

    (define (dispatch m)
      (cond ((eq? m 'lookup-proc) lookup)
            ((eq? m 'insert-proc!) insert!)
            (else "Unknown operation -- TABLE")))
    dispatch))

(define tt (make-table))
(define get (tt 'lookup-proc))
(define put (tt 'insert-proc!))

(put (list 1 2 3 4 5) 11)
(get (list 1 4 5))