; 1.3

(define (sum-intergers a b)
  (if (> a b)
      0
      (+ a (sum-intergers (+ a 1) b))))

(sum-intergers 1 2)


(define (sum-cubes a b)
  (if (> a b)
      0
      (+ (cube a) (sum-cubes (+ a 1) b))))

(define (cube x)
  (* x x x))

(sum-cubes 5 5)


(define (pi-sum a b)
  (if (> a b)
      0
      (+ (/ 1.0 (* a (+ a 2)))
         (pi-sum (+ a 4) b))))

(pi-sum 1 1000)
(* 8 (pi-sum 1 1000))


(define (sum-t term a next b)
  (if (> a b)
      0
      (+ (term a)
         (sum-t term (next a) next b))))

(define (pi-sum-1 a b)
  (define (bf x)
    (/ 1.0 (* x (+ x 2))))
  (define (nt y)
    (+ y 4))
  (sum-t bf a nt b))

(pi-sum-1 1 1000)
(* 8 (pi-sum-1 1 1000))


