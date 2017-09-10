; 2.39

(load "2_38.rkt")

(define (revese-right sequence)
  (fold-right (lambda (x y)
                (append y (list x)))
              (list)
              sequence))

(define (revese-left sequence)
  (fold-left (lambda (x y)
               (append (list y) x))
              (list)
              sequence))

(define t (list 1 2 3))

(revese-right t)
(revese-left t)