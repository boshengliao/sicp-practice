; 2.77

#|

因为数据结构最外层类似 ('complex ('rectangular datas)).

运行过程是, 先调用 magnitude, 其中有 get 获得外层标记
有 'complex 的 magnitude, 并赋值给 proc, 然后 proc 再次调
用 magnitude 来获取 'rectangular 的数据.

因此其中共调用了2次 apply-generic.

|#