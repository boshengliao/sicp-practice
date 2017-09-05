; 2.25

(define t (list 1 3 (list 5 7) 9))
(display t)
(newline)

(define t1 (list (list 7)))
(display t1)
(newline)

(define t2 (list 1 (list 2 (list 3 (list 4 (list 5 (list 6 7)))))))
(display t2)
(newline)

(car (cdr (car (cdr (cdr t)))))

(car (car t1))

(car (cdr (car (cdr (car (cdr (car (cdr (car (cdr (car (cdr t2))))))))))))