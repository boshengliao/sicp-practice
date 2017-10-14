; 3.22


(define (make-queue)
  (let ((queue (cons '() '())))
    (define (front-ptr queue) (car queue))

    (define (rear-ptr queue) (cdr queue))

    (define (set-front-ptr! queue item)
      (set-car! queue item))

    (define (set-rear-ptr! queue item)
      (set-cdr! queue item))

    (define (empty-queue? queue)
      (null? (front-ptr queue)))
    
    (define (front-queue queue)
      (if (empty-queue? queue)
          "FRONT called with an empty queue"
          (car (front-ptr queue))))

    (define (insert-queue! item)
      (let ((new-pair (cons item '())))
        (cond ((empty-queue? queue)
               (set-front-ptr! queue new-pair)
               (set-rear-ptr! queue new-pair))
              (else
               (set-cdr! (rear-ptr queue) new-pair)
               (set-rear-ptr! queue new-pair)
               (print-queue)))))

    (define (delete-queue!)
      (cond ((empty-queue? queue)
             "DELETE called with an empty queue")
            (else
             (set-front-ptr! queue (cdr (front-ptr queue)))
             (print-queue))))

    (define (print-queue)
      (display queue)
      (newline)
      (front-ptr queue))
    
    (define (dispatch m)
      (cond ((eq? m 'insert-queue!) insert-queue!)
            ((eq? m 'delete-queue!) (delete-queue!))
            ((eq? m 'print-queue) (print-queue))))
    dispatch))

(define q (make-queue))
;((q 'insert-queue!) 'a)

;((q 'insert-queue!) 'b)
(q 'delete-queue!)
((q 'insert-queue!) 'c)
;(q 'print-queue)
;(q 'delete-queue!)
;(q 'delete-queue!)
