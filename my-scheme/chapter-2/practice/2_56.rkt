; 2.56

(define (deriv-old exp var)
  (cond ((number? exp) 0)
        ((variable? exp)
         (if (same-variable? exp var) 1 0))
        ((sum? exp)
         (make-sum-old (deriv (addend exp) var)
                       (deriv (augend exp) var)))
        ((product? exp)
         (make-sum-old
          (make-product-old (multiplier exp)
                            (deriv (multiplicand exp) var))
          (make-product-old (deriv (multiplier exp) var)
                            (multiplicand exp))))
        (else
         (display "unknown expression type -- DERIV"))))

(define (deriv exp var)
  (cond ((number? exp) 0)
        ((variable? exp)
         (if (same-variable? exp var) 1 0))
        ((sum? exp)
         (make-sum (deriv (addend exp) var)
                   (deriv (augend exp) var)))
        ((product? exp)
         (make-sum
          (make-product (multiplier exp)
                        (deriv (multiplicand exp) var))
          (make-product (deriv (multiplier exp) var)
                        (multiplicand exp))))
        (else
         (display "unknown expression type -- DERIV"))))

(define (variable? x) (symbol? x))

(define (same-variable? v1 v2)
  (and (variable? v1) (variable? v2) (eq? v1 v2)))

(define (make-sum-old a1 a2)
  (list '+ a1 a2))

(define (make-product-old m1 m2)
  (list '* m1 m2))

(define (sum? x)
  (and (pair? x) (eq? (car x) '+)))

(define (addend x) (cadr x))

(define (augend x) (caddr x))

(define (product? x)
  (and (pair? x) (eq? (car x) '*)))

(define (multiplier p) (cadr p))

(define (multiplicand p) (caddr p))

(define (make-sum a1 a2)
  (cond ((=number? a1 0) a2)
        ((=number? a2 0) a1)
        ((and (number? a1) (number? a2)) (+ a1 a2))
        (else (list '+ a1 a2))))

(define (=number? exp num)
  (and (number? exp) (= exp num)))

(define (make-product m1 m2)
  (cond ((or (=number? m1 0) (=number? m2 0)) 0)
        ((=number? m1 1) m2)
        ((=number? m2 1) m1)
        ((and (number? m1) (number? m2)) (* m1 m2))
        (else (list '* m1 m2))))

;;;;
(define (deriv-new exp var)
  (cond ((number? exp) 0)
        ((variable? exp)
         (if (same-variable? exp var) 1 0))
        ((sum? exp)
         (make-sum (deriv (addend exp) var)
                   (deriv (augend exp) var)))
        ((product? exp)
         (make-sum
          (make-product (multiplier exp)
                        (deriv-new (multiplicand exp) var))
          (make-product (deriv-new (multiplier exp) var)
                        (multiplicand exp))))
        ((exponentiation? exp)
         (make-product (make-exponentiation (base exp)
                                            (exponent exp))
                       (deriv-new (base exp) var)))
        (else
         (display "unknown expression type -- DERIV"))))

(define (exponentiation? x)
  (eq? (car x) '**))

(define (base x)
  (cadr x))

(define (exponent x)
  (caddr x))

(define (make-exponentiation x n)
  (cond ((=number? n 0) 1)
        ((=number? x 1) x)
        ((and (number? x) (number? n))
         (* n (zhishu-func x (- n 1))))
        (else (list '* n (list '** x (list '- n 1))))))

(make-exponentiation 'u 'n)

(define (zhishu-func x n)
  (define (iter r c)
    (if (= c n)
        r
        (iter (* r x) (+ c 1))))
  (iter 1 0))

(deriv-new '(** x u) 'x)
(deriv-new 'n 'x)