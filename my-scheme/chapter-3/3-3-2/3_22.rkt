; 3.22


(define (make-queue)
  (let ((front-ptr '())
        (rear-ptr '()))

    (define (set-front-ptr! item)
      (set! front-ptr item))

    (define (set-rear-ptr! item)
      (set! rear-ptr item))

    (define (empty-queue?)
      (null? front-ptr))
    
    (define (front-queue)
      (if (empty-queue? front-ptr)
          "FRONT called with an empty queue"
          front-ptr))

    (define (insert-queue! item)
      (let ((new-pair (cons item '())))
        (cond ((empty-queue?)
               (set-front-ptr! new-pair)
               (set-rear-ptr! new-pair)
               front-ptr)
              (else
               (set-cdr! rear-ptr new-pair)
               (set-rear-ptr! new-pair)
               front-ptr))))

    (define (delete-queue!)
      (cond ((empty-queue?)
             "DELETE called with an empty queue")
            (else
             (set-front-ptr! (cdr front-ptr))
             front-ptr)))
    
    (define (dispatch m)
      (cond ((eq? m 'insert-queue!) insert-queue!)
            ((eq? m 'delete-queue!) (delete-queue!))
            ((eq? m 'print-queue) front-ptr)
            ))
    dispatch))

(define q (make-queue))
((q 'insert-queue!) 'a)

;((q 'insert-queue!) 'b)
;(q 'delete-queue!)
;((q 'insert-queue!) 'c)
(q 'print-queue)
(q 'delete-queue!)
(q 'delete-queue!)
