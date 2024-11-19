#lecture
# 09 - real numbers
class: [[CM12002]]
topics mentioned: #binary #data
date: 2024-10-31
teacher: [[Fabio Nemetz]]
## real numbers, continued
> *continuing from [[08 - more on sets|lecture 8]]:*

> [!EXAMPLE] example
> take the following 32 bit stream to be a single precision floating point number.
> $$00111110001100000000000000000000$$
> we can split it into three parts:
> $$\textcolor{#1e90ff}{0}\ \ \textcolor{green}{01111100}\ \ \textcolor{red}{01100000000000000000000}$$
> the first is a **sign [[bit]]**, the next is a **8 [[bit]]** exponent, and the last is a **23 [[bit]]** mantissa.
> thus, the exponent can go from -126 to 127 (all zeros and all ones are reserved for special values). the mantissa has an implied leading 1, so it's actually 24 bits, but we only store 23 bits.
> if we now convert our bits, we get:
> + **sign**: $0$ (positive)
> + **exponent**: $01111100 = 124 = 124-127=-3$
> + **mantissa**: $1+2^{-2}+2^{-3}=1+0.25+0.125=1.375$
> + **value**: $1.375\times 2^{-3}=1.375\times0.125=0.171875$
## special cases
there are a few special cases for [[IEEE 754]].
+ **zero**: a zero mantissa and exponent is considered to be equivalent to 0. *this means that the leading 1 is ignored here.*
+ **NaN**: any number with a maximum exponent and *non-zero* mantissa is considered `NaN`, or not a number.
+ **Infinity**: any number with max exponent and *zero* mantissa is considered to be infinity.
## floating point arithmetic
to run addition or subtraction on real numbers, we:
1) **de-normalise** the smaller operand and adjust its exponent to be *the same* as that of the other operand.
2) **perform** the arithmetic
3) **re-normalise** the mantissa, adjusting the exponent if needed
to run multiplication:
1) **multiply** the mantissae, and **add** the exponents.
2) **re-normalise** the mantissa, adjusting the exponent if needed.
to run division, we can simply multiply one operand by the other$^{-1}$.