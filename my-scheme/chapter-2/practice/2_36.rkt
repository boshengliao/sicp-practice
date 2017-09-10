; 2.36

(define (accumulate op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence)
          (accumulate op initial (cdr sequence)))))

(define (accumulate-n op init seqs)
  (if (null? (car seqs))
      (list)
      (cons (accumulate op init (car-map seqs))
            (accumulate-n op init (cdr-map seqs)))))

(define s (list (list 1 2 3)
                (list 4 5 6)
                (list 7 8 9)
                (list 10 11 12)))
(display s)


(define (car-map x)
  (map car x))

(car-map s)

(define (cdr-map x)
  (map cdr x))
(cdr-map s)
(car-map (cdr-map s))

(accumulate + 0 (car-map s))
(accumulate + 0 (car-map (cdr-map s)))
(accumulate + 0 (car-map (cdr-map (cdr-map s))))

(accumulate-n + 0 s)