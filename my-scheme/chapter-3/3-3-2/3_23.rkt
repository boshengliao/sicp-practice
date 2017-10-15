; 3.23

(define (make-deque)
  (let ((front-ptr '())
        (rear-ptr '()))

    (define (reverse-ptr x y)
      (cond ((null? x) y)
            (else (reverse-ptr (cdr x)
                               (cons (car x) y)))
            ))
    
    (define (set-front-ptr!)
      (set! front-ptr (reverse-ptr rear-ptr
                                   '())))

    (define (set-rear-ptr!)
      (set! rear-ptr (reverse-ptr front-ptr
                                  '())))

    (define (empty-deque? x)
      (null? x))
    
    (define (front-deque)
      (if (empty-deque? x)
          "FRONT called with an empty queue"
          front-ptr))

    (define (rear-deque)
      (if (empty-deque? x)
          "REAR called with an empty queue"
          rear-ptr))

    (define (front-insert-deque! item)
      (set! front-ptr (cons item front-ptr))
      (set-rear-ptr!)
      front-ptr)
    
    (define (rear-insert-deque! item)
      (set! rear-ptr (cons item rear-ptr))
      (set-front-ptr!)
      front-ptr)

    (define (front-delete-deque!)
      (cond ((empty-deque? front-ptr)
             "FRONT DELETE called with an empty queue")
            (else
             (set! front-ptr (cdr front-ptr))
             (set-rear-ptr!)
             front-ptr)))

    (define (rear-delete-deque!)
      (cond ((empty-deque? rear-ptr)
             "REAR DELETE called with an empty queue")
            (else
             (set! rear-ptr (cdr rear-ptr))
             (set-front-ptr!)
             front-ptr)))
    
    (define (dispatch m)
      (cond ((eq? m 'front-insert-deque!) front-insert-deque!)
            ((eq? m 'front-delete-deque!) (front-delete-deque!))
            ((eq? m 'rear-insert-deque!) rear-insert-deque!)
            ((eq? m 'rear-delete-deque!) (rear-delete-deque!))
            ((eq? m 'print-front-ptr) front-ptr)
            ((eq? m 'print-rear-ptr) rear-ptr)
            ))
    dispatch))

(define dq (make-deque))

((dq 'front-insert-deque!) 'c)
((dq 'front-insert-deque!) 'b)
((dq 'front-insert-deque!) 'a)
(dq 'front-delete-deque!)
(dq 'front-delete-deque!)
(dq 'front-delete-deque!)

((dq 'rear-insert-deque!) 'a)
((dq 'rear-insert-deque!) 'b)
((dq 'rear-insert-deque!) 'c)
(dq 'rear-delete-deque!)
(dq 'rear-delete-deque!)