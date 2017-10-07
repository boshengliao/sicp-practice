; 3.6

(define (rand-update x)
  (+ x 2))

(define rand
  (let ((x 1))
    (lambda ()
      (set! x (rand-update x))
      x)))

;;
(define rand-new
  (let ((v 1))
    (define generate
      (lambda ()
        (set! v (rand-update v))
        v))
    (define reset
      (lambda (value)
        (display v)
        (set! v value)
        v))
    (define dispatch
      (lambda (x)
        (cond ((eq? x 'generate)
               (generate))
              ((eq? x 'reset)
               reset))))
    dispatch))

(rand)
(rand)
(rand)

(rand-new 'generate)
(rand-new 'generate)
(rand-new 'generate)

((rand-new 'reset) 5)
((rand-new 'reset) 6)
(rand-new 'generate)