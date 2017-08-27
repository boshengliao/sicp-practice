; 2.1

(define (add-rat x y)
    (make-rat (+ (* (numer x) (denom y))
                 (* (numer y) (denom x)))
              (* (denom x) (denom y))))

(define (sub-rat x y)
    (make-rat (- (* (numer x) (denom y))
                 (* (numer y) (denom x)))
              (* (denom x) (denom y))))

(define (mul-rat x y)
  (make-rat (* (numer x) (numer y))
            (* (denom x) (denom y))))

(define (div-rat x y)
  (make-rat (* (numer x) (denom y))
            (* (denom x) (numer y))))

(define (equal-rat? x y)
  (= (* (numer x) (denom y))
     (* (numer y) (denom x))))


(define (make-rat n d)
  (let ((g (gcd n d))
        (t (/ n d)))
    (cond ((and (> t 0) (= t 1)) 1)
          ((> t 0) (cons (abs (/ n g)) (abs (/ d g))))
          ((and (< t 0) (= t 1)) -1)
          (else (cons (- (abs (/ n g))) (abs (/ d g)))))))

(define (numer x) (car x))

(define (denom x) (cdr x))

(define (print-rat x)
  (newline)
  (display (numer x))
  (display "/")
  (display (denom x)))

(define t1 (make-rat -1 3))
(define t2 (make-rat 2 3))

(define t3 (cons 1 3))
(print-rat t1)

(print-rat (sub-rat t1 t2))