; 2.3.1

(define a 1)

(define b 2)

(list a b)

(list 'a 'b)

(car '(a b c))

(cdr '(a b c))

(define (memq-new item x)
  (cond ((null? x) false)
        ((eq? item (car x)) x)
        (else (memq item (cdr x)))))

(memq 'apple '(pear banana prune))
(memq 'apple '(x (apple sauce) y apple pear))
(memq-new 'apple '(pear banana prune))
(memq-new 'apple '(x (apple sauce) y apple pear))