; 2.55

(car ''abracadabra)

(car '(ccc abracadabra))
(quote a)
'a
(car '(a b c))
(list 'car (list 'quote '(a b c)))

; 因为过程 quote 的完整表达式为 (quote <expression>)
; 只有最外层的 quote 是过程, 中间的 quote 已经被当成了表
(car (quote (quote abracadabra)))
