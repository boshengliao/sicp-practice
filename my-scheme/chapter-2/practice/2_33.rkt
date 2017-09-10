; 2.33

(define (accumulate op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence)
          (accumulate op initial (cdr sequence)))))

(define (square x) (* x x))

(define (map-new p sequence)
  (accumulate (lambda (x y)
                (cons (p x) y))
              (list)
              sequence))

(map-new square (list 1 2 3))

;;;;
(define (append-new seq1 seq2)
  (accumulate cons seq2 seq1))

(append-new (list 1 2 3) (list 4 5 6))

;;;;
(define (length-new sequence)
  (accumulate length-func 0 sequence))

(define length-func
  (lambda (x y)
    (+ 1 y)))

(length-new (list 1 2 3 5))