; 2.78

(define (attach-tag type-tag contents)
  (if (number? contents)
      contents
      (cons type-tag contents)))

(define (type-tag datum)
  (cond ((pair? datum) (car datum))
        ((number? datum) 'scheme-number)
        (else (error "Bad tagged datum -- TYPE-TAG" datum))))

(define (contents datum)
  (cond ((pair? datum) (cdr datum))
        ((number? datum) datum)
        (else (error "Bad tagged datum -- CONTENTS" datum))))

;;;;
(define test (map type-tag (list 1 2)))
(equal? '(scheme-number scheme-number)
        (map type-tag (list 1 2)))

(pair? '(scheme-number scheme-number))
(symbol? '(scheme-number scheme-number))
(symbol? 'scheme-number)
(pair? test)
(symbol? test)
(symbol? 'scheme-number)
(eq? '(1) '(1))
(cdr '(1))