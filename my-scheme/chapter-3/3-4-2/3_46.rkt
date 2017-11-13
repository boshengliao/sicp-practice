; 3.45

#|
如果用常规过程:

(if (car cell)
    (the-mutex 'acquire)
    (set-car! cell #t))

这样在一个进程发现 cell 为 #f 时, 可能同时会有很多进程已经
进入了 (make-mutex) 生成的环境E, 且此时 cell 还没有被改变,
其他进程访问到的 cell 依旧为 #f.
但是当使用 test-and-set! 函数, 每次个进程调用都会产生新的
环境En+1去检查 cell, 而此时会回到环境E访问 cell, 按照
test-and-set! 依次执行, 所以每次都能获得最新的值.
|#