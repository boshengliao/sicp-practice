; 3.24

(define (make-table check-func)
  (let ((local-table (list '*table*)))
    (define (assoc key records)
      (cond ((null? records) #f)
            ((check-func key (caar records)) (car records))
            (else (assoc key (cdr records)))))
    (define (lookup key-1 key-2)
      (let ((subtable (assoc key-1 (cdr local-table))))
        (if subtable
            (let ((record (assoc key-2 (cdr subtable))))
              (if record
                  (cdr record)
                  #f))
            #f)))
    (define (insert! key-1 key-2 value)
      (let ((subtable (assoc key-1 (cdr local-table))))
        (if subtable
            (let ((record (assoc key-2 (cdr subtable))))
              (if record
                  (set-cdr! record value)
                  (set-cdr! subtable
                            (cons (cons key-2 value)
                                  (cdr subtable)))))
            (set-cdr! local-table
                      (cons (list key-1
                                  (cons key-2 value))
                            (cdr local-table)))))
      (display local-table)
      'ok)
    (define (dispatch m)
      (cond ((eq? m 'lookup-proc) lookup)
            ((eq? m 'insert-proc!) insert!)
            (else "Unknown operation -- TABLE")))
    dispatch))

(define (same-key? x y)
  (let ((v (/ (exact->inexact x) y)))
    (if (and (> v 0.5) (< v 1.5))
        #t
        #f)))

(define t (make-table same-key?))
(define get (t 'lookup-proc))
(define put (t 'insert-proc!))

(put 10 20 'aa)
(put 1000 200 'bb)
(get 8 23)
(get 1000 160)