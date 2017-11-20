; 3.51

(load "instance.rkt")

(define (show x)
  (display-line x)
  (newline))

(define x (stream-map show
                      (stream-enumerate-interval 0 10)))

;(stream-ref x 5)
(display "aaa")
(stream-ref x 7)
(display "aaa")