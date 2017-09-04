; 2.2.1

(list 1 2 3 4)
(define l (list 1 2 3 4))
(display l)
(newline)

(car l)
(cdr l)
(car (cdr l))
(cons 10 l)
(cons l (cons 10 10))
(cons 5 l)
#|
(define (list-ref items n)
  (if (= n 0)
      (car items)
      (list-ref (cdr items) (- n 1))))
|#
(define squares (list 1 4 9 16 25))

(list-ref squares 4)
#|
(define (length items)
  (if (null? items)
      0
      (+ 1 (length (cdr items)))))
|#

(length squares)

(define (length-iter items)
  (define (length-i a count)
    (if (null? a)
        count
        (length-i (cdr a) (+ count 1))))
  (length-i items 0))

(length-iter squares)

(define odds (list 1 3 5 7))


(append squares odds)
(append odds squares)

(define (append-i list1 list2)
  (if (null? list1)
      list2
      (cons (car list1) (append-i (cdr list1) list2))))

(append-i odds squares)


(map abs (list -10 -2 100))

(define (scale-list items factor)
  (map (lambda (x) (* x factor))
       items))

(scale-list (list 2 4 6) 2)