; 2.80

(define (=zero? x)
  (apply-generic '=zero? x))

(define (=zero? x)
  (if (number? x)
      (= x 0)
      #f))

(put '=zero? '(scheme-number)
     (lambda (x)
       (= x 0)))

(put '=zero? '(rational)
     (lambda (x)
       (= (number x) 0)))

(put '=zero? '(complex complex)
     (lambda (x y)
       (let ((a (real-part x))
             (b (imag-part y)))
         (and (= a 0) (= b 0)))))