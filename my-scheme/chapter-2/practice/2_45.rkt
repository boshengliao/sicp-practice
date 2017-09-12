; 2.45

(define (right-split painter n)
  (if (= n 0)
      painter
      (let ((smaller (right-split painter (- n 1))))
        (beside painter (below smaller smaller)))))

(define (up-split painter n)
  (if (= n 0)
      painter
      (let ((smaller (up-split painter (- n 1))))
        (below painter (beside smaller smaller)))))

(define (split x y)
  (lambda (painter n)
    (if (= n 0)
        painter
        (let ((smaller ((split x y) painter (- n 1))))
          (x painter (y smaller smaller))))))