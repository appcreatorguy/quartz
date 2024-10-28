#lecture
# 07 - data representation cont.
class: [[CM12002]]
topics mentioned: #data #binary #hexadecimal 
date: 2024-10-24
teacher: [[Fabio Nemetz]]
## unsigned integers
in one byte, we can store 256 different numbers from 0 to 255. these are called *[[unsigned integers]]*, as they have no sign, and so can only be assumed to be positive.
```
00000000    000
00000001    001
00000010    002
00000011    003
  ...       ...
11111110    254
11111111    255
```

## [[signed integers]] 
### sign and magnitude
this is the simplest way to represent negative integers. we let the first bit in the byte represent the sign of the integer, called the sign bit. if it is high, the number is negative.
```
   ...      ...
10000010   -002
10000001   -001
10000000    000
00000000    000
00000001    001
00000010    002
   ...      ...
```
this has some drawbacks:
+ there are two representations for 0, +0 and -0, which is not that helpful
+ we limit the range of values that we can store, as we lose a bit for encoding the numbers to the sign bit.
however, this method provides an easy to read way to encode negative values.
## 2s complement
a negative number in 2s complement is obtained by **flipping the bits of the positive number and adding 1** ($-n = \lnot n + 1_2$)
```
01111111    +127
01111110    +126
  ...        ...
00000010    +002
00000001    +001
00000000    ±000
11111111    -001
11111110    -002
  ...        ...
10000001    -127
10000000    -128
```
this has a large advantage in that it gets rid of there being two representations of 0, and also it facilitates easy arithmetic. this is because in 2s complement, **the largest digit represents -128**, or the negative of the largest positive value + 1. therefore, we can easily do arithmetic without any special cases for the negative numbers. 
however, this does make the representation asymmetric, as the range for a byte is now -128 — 127.