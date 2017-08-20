; 1.30
(define (cube x)
(* x x x))
(define (simples f a b n)
  (define h (/ (- b a) n))
  (define (func-y x)
    (f (+ a (* x h))))
  (define (inc x)
    (+ x 1))
  (define (odd? x)
    (define (func counter)
      (if (< counter x)
          (func (+ counter 2))
          counter))
    (if (= (- (func 0) x) 1)
        #t
        #f))
  (define (factor x)
    (cond ((or (= x 0) (= x n)) 1)
          ((odd? x) 4)
          (else 2)))
  (define (func-1 counter inc)
    (cond ((> counter n) 0)
          (else
           (+ (* (factor counter)
                 (func-y counter))
              (func-1 (inc counter) inc)))))
  (* (/ h 3.0)
     ; 这里用了 (exact->inexact 0) 代替 0
     ; 才能正确精确要小数点后面的位数
     (func-1 (exact->inexact 0) inc)))

(simples cube 0 1 100)
(simples cube 0 1 1000)