; 2.41

(load "2_40.rkt")

(unique-pairs 5)

(define (unique-tribles n)
  (flatmap
   (lambda (i)
     (map (lambda (j) (cons i j))
          (unique-pairs (- i 1))))
   (enumerate-interval 1 n)))

(unique-tribles 5)

(define (filter-sum x)
  (lambda (i)
    (let ((v (+ (car i) (cadr i) (caddr i))))
      (if (= v x)
          (list i)
          (list)))))

(flatmap (filter-sum 10) (unique-tribles 5))

(define (get-tribles-sum seq-value sum-value)
  (flatmap (filter-sum sum-value)
           (unique-tribles seq-value)))

(get-tribles-sum 8 10)