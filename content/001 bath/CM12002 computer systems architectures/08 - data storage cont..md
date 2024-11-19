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
scientific notation has a few advantages:
+ it is very **simple to understand**
+ it can represent **a large amount of numbers with relatively few digits**
+ it is **fairly accurate in terms of precision**
however, there are also disadvantages:
+ it can **only give an approximation** of numbers which can otherwise be expressed exactly, such as *recurring decimals* or *irrational numbers*.
+ it can introduce **rounding errors** in large calculations due to digits being truncated, leading to a loss of precision over time.
### [[normalised representation]]
![[normalised representation]]
## floating point in [[binary]] 
when we store floating points in [[binary]], we use [[normalised representation]], with a *radix* 2.
therefore, a number can be stored as $\pm m\times 2^{\pm x}$, and can be stored as two signed parts in memory, a sign bit, a mantissa, another sign bit, and a exponent.
## [[IEEE 754]]
[[IEEE 754]] is a standard for floating-point representation in computers, a widely-used format for encoding real numbers in binary. it defines several formats for floating-point numbers, including single precision, which uses 4 bytes and double precision which uses 8 bytes.
we'll use single precision here as it is easier to show.
### single precision
> [!EXAMPLE] example
> take the following 32 bit stream to be a single precision floating point number.
> $$00111110001000000000000000000000$$
> we can split it into three parts:
> $$\textcolor{#1e90ff}{0}\ \ \textcolor{green}{01111100}\ \ \textcolor{red}{01000000000000000000000}$$
> the first is a **sign [[bit]]**, the next is a **8 [[bit]]** exponent, and the last is a **23 [[bit]]** mantissa.
> thus, the exponent can go from -126 to 127 (all zeros and all ones are reserved for special values). the mantissa has an implied leading 1, so it's actually 24 bits, but we only store 23 bits.

> *continued in [[09 - real numbers|lecture 9]]*