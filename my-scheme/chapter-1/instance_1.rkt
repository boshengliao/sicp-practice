(+ 137 349)

(- 1000 334)

(* 5 99)

(/ 10 5)

(+ 2.7 10)

(+ 21 35 12 7)

(* 25 4 12)

(+ (* 3 5) (- 10 6))

(+ (* 3
      (+ (* 2 4)
         (+ 3 5)))
   (+ (- 10 7)
      6))

(define size 2)
size

(* 5 size)

(define pi 3.14159)
(define radius 10)

(* pi (* radius radius))

(define circumference (* 2 pi radius))
circumference

(* (+ 2 (* 4 6))
   (+ 3 5 7))

(define (square x) (* x x))
(square 12)
(square (+ 2 5))
(square (square 3))

(define (sum-of-squares x y)
  (+ (square x) (square y)))
(sum-of-squares 3 4)

(define (f a)
  (sum-of-squares (+ a 1) (* a 2)))
(f 5)

(define (absValue1 x)
  (cond ((< x 5) (+ x 1))
        ((> x 0) x)
        ((= x 0) 0)
        ((< x 0) (- x))))
(absValue1 3)
(absValue1 6)

(define (absValue2 x)
  (cond ((> x 0) x)
        (else (- x))))
(absValue2 5)

(define (absValue3 x)
  (if (< x 0)
      (- x)
      x))
(absValue3 1)

(define (t1 x)
  (if (and (> x 5)
           (< x 10))
      x
      1))
(t1 5)
(t1 10)
(t1 7)

(define (gt1 x y)
  (or (> x y)
      (= x y)))
(gt1 1 2)
(gt1 2 1)

(define (gt2 x y )
  (not (< x y)))
(gt2 1 2)
(gt2 2 1)


(define (sqr-1 x) (* x x))

(define (sqr-2 x)
  (exp (double-1 (log x))))

(define (double-1 x) (+ x x))

(sqr-1 3)
(sqr-2 3)
(double-1 3)


(define (testprint x)
  (display "hello world\n")
  (+ x x))

(testprint 1)


(define (t-factorial n)
  (if (= n 1)
      1
      (* n (t-factorial (- n 1)))))

(t-factorial 5)

(define (t-factorial-1 n)
  (define (t-iter r c)
    (if (> c n)
        r
        (t-iter (* r c)
                (+ c 1))))
  (t-iter 1 1))

(t-factorial-1 6)


(define (fabiter x)
  (define (iter m n h)
    (if (= h x)
        m
        (iter n
              (+ m n)
              (+ h 1))))
  (iter 0 1 0))

(fabiter 12)


(define (count-change amount)
  (cc amount 5))

(define (cc amount kinds-of-coins)
  (cond ((= amount 0) 1)
        ((or (< amount 0) (= kinds-of-coins 0)) 0)
        (else (+ (cc amount
                     (- kinds-of-coins 1))
                 (cc (- amount
                        (first-denomination kinds-of-coins))
                     kinds-of-coins)))))

(define (first-denomination kinds-of-coins)
  (cond ((= kinds-of-coins 1) 1)
        ((= kinds-of-coins 2) 5)
        ((= kinds-of-coins 3) 10)
        ((= kinds-of-coins 4) 25)
        ((= kinds-of-coins 5) 50)))

;(count-change 100)
;(count-change 10)

(define (cc1 x)
  (cc2 x 1 0))

(define (cc2 at koc ct)
  (if (> (- at (first-denomination koc)) 0)
      (cc2 (- at (first-denomination koc)) koc ct)
      (if (= (- at (first-denomination koc)) 0)
          (cc2 at (+ koc 1) (+ ct 1))
          ct)))

(cc1 10)