; 2.79

(define (equ? x y)
  (apply-generic 'equ? x y))

(put 'equ? '(complex complex) equal?)
(put 'equ? '(scheme-number scheme-number) equal?)
(put 'equ? '(rational rational) equal?)

(+ '1 1)
(symbol? '1)