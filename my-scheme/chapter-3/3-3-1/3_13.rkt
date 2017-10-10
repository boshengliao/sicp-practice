; 3.13

(load "3_12.rkt")

(define (make-cycle x)
  (set-cdr! (last-pair x) x)
  x)

(define z (make-cycle (list 'a 'b 'c)))

; 期待 (a *) (b *) (c *) (a *)...

z
(cdddr (cdddr (cddddr z)))

(last-pair z)
; 程序会一直运行直到报错