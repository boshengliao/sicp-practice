; 3.11

#|
(make-account 50) 创建了环境E1,
acc 约束了 dispatch 的体在全局环境里,
(acc 'deposit) 调用 dispatch 创建了新环境E2且返回 deposit 的体,
调用 (deposit 40) 则创建新环境E4, 其体的执行环境是E1, 得到结果90.

取钱同上.

两个账户通过全局环境的独立外围/下属环境, 实现了数据保持不同,
他们共享了 dispatch 的体.
|#