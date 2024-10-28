#lecture
# 08 - data representation cont.
class: [[CM12002]]
topics mentioned: #data 
date: 2024-10-25
teacher: [[Fabio Nemetz]]
## integers in programming languages
in C, there are multiple types of integers:
```c
unsigned int n;
signed int n;
int n; /* same as unsigned */
```
number types in C have the following number of bits:
+ `char` is 8 bits
+ `short` is **often** 16 bits
+ `int` is **often** 32 bits
+ `long` is **often** 64 bits
the number of bits can vary depending on the architecture the code is being compiled for.
for example, for the Arduino UNO:
+ `(unsigned) int`: 16 bits
+ `word`: same as unsigned int
+ `(unsigned) long`: 32 bits
+ `(unsigned) short`: 16 bits
+ `byte` : 8 bits
## text
to store *character data*, we give a **unique pattern of bits** to each one.
for example, we need:
+ 26 patterns for the upper case letters
+ 26 for the lower case letters
+ 10 for the decimal digits
+ and a few others for punctuation, asterisks and other symbols.
### [[ASCII]]
it commonly turns out that to encode the majority of English text data, fewer than 128 bit patterns were needed. therefore, a [[byte]] was assigned to store a single character. from this information, a code scheme was created, called [[ASCII]], or **A**merican **S**tandard **C**ode for **I**nformation **I**nterchange.
this was then quickly extended to use the full byte and 256 patterns, with Extended [[ASCII]], or EASCII, and then eventually to [[Unicode]], which uses *up to* 32 bits to represent patterns to represent up to **2 billion different characters**, while remaining backwards compatibility with ASCII through **UTF-8**, a variable-width character encoding.
## real numbers
ideally, we want encoding of real numbers (decimals) which is *precise* and *unambiguous*. however, there is an **infinite** number of numbers between any two integers, so we will have to concede at least slightly on one of these characteristics.
non-integer numbers are often represented in *scientific* notation (*standard form*).
for example:
$$16.37=1.637\times10^1$$
$$-234.0=-2.34\times10^2$$
$$0.0000367=3.67\times10^-5$$
scientific notation contains a **mantissa** (that is *normalised*, or between 1 and the base), and an **exponent** (which is some power of the base).