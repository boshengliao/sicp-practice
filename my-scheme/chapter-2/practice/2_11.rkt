; 2.11

(load "2_7.rkt")

#|
(a, b) * (c, d)

1):
a>0 b>0 c>0 d>0
max = b * d
min = a * c

2):
a<0 b>0 c>0 d>0
max = b * d
min = a * d

3):
a>0 b<0 c>0 d>0
max = a * d
min = b * d

4):
a>0 b>0 c<0 d>0
max = b * d
min = b * c

5):
a>0 b>0 c>0 d<0
max = b * c
min = b * d

6)
a<0 b<0 c>0 b>0
max = a * c
min = b * d

7):
a<0 b>0 c<0 d>0
max = b * d
when a > c, b == d
min = a * d
when a < c, b == d
min = b * c

8):
a<0 b>0 c>0 d<0
when a > c, b == d
max = a * d
when a < c, b == d
max = b * c
min = b * d

9):
a<0 b<0 c<0 d<0
max = a * c
min = b * d
|#

