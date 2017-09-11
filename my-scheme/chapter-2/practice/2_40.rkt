; 2.40

(load "../instance/2_2_3.rkt")

(define (prime-sum-pairs n)
  (map make-pair-sum
       (filter prime-sum?
               (flatmap
                (lambda (i)
                  (map (lambda (j) (list i j))
                       (enumerate-interval 1 (- i 1))))
                (enumerate-interval 1 n)))))

(define (unique-pairs n)
  (flatmap
   (lambda (i)
     (map (lambda (j) (list i j))
          (enumerate-interval 1 (- i 1))))
   (enumerate-interval 1 n)))

(define (prime-sum-pairs-new n)
  (map make-pair-sum
       (filter prime-sum?
               (unique-pairs n))))

(newline)
(prime-sum-pairs 6)

(prime-sum-pairs-new 6)