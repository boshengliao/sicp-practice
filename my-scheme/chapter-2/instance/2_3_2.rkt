; 2.3.2

#|
(variable? e)
(same-variable? v1 v2)

(sum? e)
(addend e)
(augend e)
(make-sum a1 a2)

(product? e)
(multiplier e)
(multiplicand e)
(make-product m1 m2)
|#

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
(deriv-old '(+ x 3) 'x)

(deriv-old '(* x y) 'x)

(deriv-old '(* (* x y) (+ x 3)) 'x)

(deriv '(+ x 3) 'x)

(deriv '(* x y) 'x)

(deriv '(* (* x y) (+ x 3)) 'x)
