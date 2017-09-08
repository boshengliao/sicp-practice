; 2.29

(define (make-mobile left right)
  (list left right))

(define (make-branch length structure)
  (list length structure))

(define (left-branch x)
  (car x))

(define (right-branch x)
  (cadr x))

(define (branch-length x)
  (car x))

(define (branch-structure x)
  (cadr x))

; b)
(define (total-weight x)
  (let ((l (left-branch x))
        (r (right-branch x)))
    (let ((lv (branch-structure l))
          (rv (branch-structure r)))
      (+ (if (not (pair? lv))
             lv
             (total-weight lv))
         (if (not (pair? rv))
             rv
             (total-weight rv))))))

(define t (make-mobile (make-branch 1 2)
                       (make-branch 2 4)))
(define m (make-mobile (make-branch 1 t)
                       (make-branch 2 t)))
(total-weight m)

; c)
(define (check-balance x)
  (let ((l (left-branch x))
        (r (right-branch x)))
    (let ((ls (branch-structure l))
          (rs (branch-structure r))
          (ll (branch-length l))
          (rl (branch-length r)))
      (define (iter length structure)
        (if (not (pair? structure))
            (* length structure)
            (check-balance structure)))
      (newline)
      (display (iter ll ls))
      (newline)
      (display (iter rl rs))
      (let ((f (- (iter ll ls)
                  (iter rl rs))))
        (if (= f 0)
            #t
            f)))))

(check-balance m)


; d)
(define (branch-structure x)
  (cdr x))