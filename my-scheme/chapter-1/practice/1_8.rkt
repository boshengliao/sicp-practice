; 1.8
(define (decube guess x)
  (if (good-enough? guess x)
      guess
      (decube (get-new-guess guess x) x)))

(define (get-new-guess guess x)
  (/ (+ (get-first-arg guess x)
        (* guess 2))
     3))

(define (get-first-arg guess x)
  (/ x (* guess guess)))

(define (good-enough? guess x)
  (< (abs (- (get-cube (get-new-guess guess x))
             x))
     0.00001))

(define (get-cube x)
  (* x x x))

(define (get-decube x)
  (decube 1.0 x))

(get-decube 8)